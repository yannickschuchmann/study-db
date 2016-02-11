class CasesController < ApplicationController
  require 'json'

  before_action :set_current_case, only: [:tested, :answered]
  before_action :handle, only: [:test, :answer]

  def handle

    if @current_participant.completed?
      redirect_to completed_path
      return
    end

    set_current_case

    if @case.nil? # cases completed
      if action_name != "answer"
        redirect_to answer_case_path
      end
      return
    end

    tracking_count = @case.trackings.where(participant: @current_participant).count

    if @force_user
      if tracking_count < Case.sheets and action_name != "test"
        redirect_to test_case_path
      elsif tracking_count == Case.sheets && action_name != "answer"
        redirect_to answer_case_path
      end
    end
  end

  def debug
    @current_participant = Participant.new
    @case = Case.all[params[:case_id].to_i - 1]
    @sheet_number = params[:sheet_number]
    @debug_mode = true
    render "cases/" + @case.name.downcase.gsub(/ /, "_") + "/" + @sheet_number.to_s
  end

  def test
    flash.clear
    order = JSON.parse(@current_participant.sheet_order)
    index = @current_participant.trackings.where(case_id: @case.id).count
    @sheet_number = order[index]

    render "cases/" + @case.name.downcase.gsub(/ /, "_") + "/" + @sheet_number.to_s
  end

  def tested
    tracking = @current_participant.trackings.new(case_id: @case.id)
    tracking.time = params[:time]
    tracking.case_sheet = params[:case_sheet]
    tracking.error_counter = params[:error_counter].blank? ? 0 : params[:error_counter]
    if tracking.save
      redirect_to handle_case_path
    else
      flash[:error] = I18n.t(:tracking_error)
      redirect_to :test_case
    end
  end

  def answer
    set_current_questionary
    flash.clear
    render "cases/questionaries/" + @questionary.name
  end

  def answered
    set_current_questionary
    answers = []
    answerData = params.permit![:answers]

    if @questionary.name == "attrakdiff"
      questions = Question.all
      answerData.each do |a|
        answerData[a][:case_id] = @case.id.to_s
        answerData[a][:participant_id] = @current_participant.id
        answers << answerData[a]
      end
    else
      answerData.each do |answer|
        answer[:case_id] = @case.id.to_s unless @case.nil?
        answer[:participant_id] = @current_participant.id.to_s
        answers << answer
      end
    end

    # validations
    if answers.length == @questionary.questions.count
      is_valid = true
      answers.each do |a|
        a = Answer.new(a)
        is_valid = false if a.invalid?
      end
    else
      is_valid = false
    end
    poll = Poll.new(participant: @current_participant,
                    questionary: @questionary,
                    answered: true)

    poll.case = @case unless @case.nil?

    if is_valid and Answer.create(answers) and poll.save
      flash.clear
      redirect_to handle_case_path
    else
      flash[:error] = I18n.t(:answer_every_question)
      render "cases/questionaries/" + @questionary.name
    end
  end

  private

    def set_current_case

      if @current_participant.cases_completed?
        @case = nil
        return
      end
      cases_count = @current_participant.cases.length
      cases_order = JSON.parse(@current_participant.cases_order)
      if cases_count == 0
        @case = Case.all[cases_order[0] - 1]
        return
      end
      last_case = @current_participant.trackings.last.case

      if (last_case.completed? @current_participant)
        @case = Case.all[cases_order[cases_count] - 1] # next case
      else
        @case = last_case
      end
    end

    def set_current_questionary

      if @case.nil? and @current_participant.cases_completed?
        @questionary = Questionary.find_by_name("conclusion")
        return
      end

      polls_count = @case.polls.where(participant: @current_participant).count

      if polls_count == 0
        @questionary = Questionary.find_by_name("nasatlx")
      elsif polls_count == 1
        @questionary = Questionary.find_by_name("attrakdiff")
      end
    end
end
