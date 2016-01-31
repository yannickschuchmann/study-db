class CasesController < ApplicationController
  require 'json'

  before_action :set_current_case, only: [:tested, :answered]
  before_action :handle, only: [:test, :answer]

  def handle

    if @current_participant.cases_completed?
      redirect_to feelings_participant_path
      return
    end

    set_current_case

    tracking_count = @case.trackings.where(participant: @current_participant).count

    if @force_user
      if tracking_count < Case.sheets and action_name != "test"
        redirect_to test_case_path
      elsif tracking_count == Case.sheets && action_name != "answer"
        redirect_to answer_case_path
      end
    end
  end

  def test
    order = JSON.parse(@current_participant.sheet_order)
    index = @current_participant.trackings.where(case_id: @case.id).count
    @sheet_number = order[index]

    render "cases/" + @case.name.downcase.gsub(/ /, "_") + "/" + @sheet_number.to_s
  end

  def tested
    tracking = @current_participant.trackings.new(case_id: @case.id)
    tracking.time = params[:time]
    tracking.case_sheet = params[:case_sheet]
    if tracking.save
      redirect_to handle_case_path
    else
      redirect_to test_case_path, :flash => { :error => "Couldn't update tracking." }
    end
  end

  def answer
    @questionary = @case.questionary
  end

  def answered
    answers = params.permit![:answers]
    answers.each do |answer|
      answer[:case_id] = @case.id.to_s
      answer[:participant_id] = @current_participant.id.to_s
    end

    if Answer.create(answers) and Poll.create(participant: @current_participant,
                                              case: @case,
                                              answered: true)
      redirect_to handle_case_path
    else
      redirect_to answer_case_path, :flash => { :error => "Couldn't create answers." }
    end
  end

  private

    def set_current_case
      cases_count = @current_participant.cases.group(:id).length
      if cases_count == 0
        @case = Case.first
        return
      end

      last_case = @current_participant.trackings.last.case

      if (last_case.trackings.where(participant: @current_participant).count == Case.sheets and
          Poll.where(participant: @current_participant, case: last_case, answered: true).count > 0)
        @case = Case.all[cases_count] # next case
      else
        @case = last_case
      end
    end
end
