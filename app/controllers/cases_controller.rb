class CasesController < ApplicationController
  def handle

    if @current_participant.trackings.length == Case.count and
        @current_participant.trackings.last.try(:completed)
      redirect_to completed_path
      return
    end

    tracking = getCurrentTracking
    @case = tracking.case

    if @force_user
      if tracking.time.blank? && action_name != "test"
        redirect_to test_case_path
      elsif !tracking.time.blank? && !tracking.answered && action_name != "answer"
        redirect_to answer_case_path
      end
    end
  end

  def test
    handle

    @sheet_number = Random.rand(1..4)

    render "cases/" + @case.name.downcase.gsub(/ /, "_") + "/" + @sheet_number.to_s
  end

  def tested
    tracking = getCurrentTracking
    tracking.time = params[:time]
    tracking.case_sheet = params[:case_sheet]
    if tracking.save
      redirect_to answer_case_path
    else
      redirect_to test_case_path, :flash => { :error => "Couldn't update tracking." }
    end
  end

  def answer
    handle
    @questionary = @case.questionary
  end

  def answered
    tracking = getCurrentTracking
    answers = params.permit![:answers]
    answers.each do |answer|
      answer[:case_id] = tracking.case.id.to_s
      answer[:participant_id] = @current_participant.id.to_s
    end

    if Answer.create(answers)
      tracking.answered = true
      if tracking.save
        redirect_to handle_case_path
      else
        redirect_to answer_case_path, :flash => { :error => "Couldn't update tracking." }
      end
    else
      redirect_to answer_case_path, :flash => { :error => "Couldn't create answers." }
    end
  end

  private

    def getCurrentTracking
      tracking = @current_participant.trackings.last
      if tracking.nil?
        tracking = @current_participant.trackings.create(case: Case.first)
      elsif tracking.time.blank? || !tracking.answered
      else
        tracking = @current_participant.trackings.create(case: Case.all[@current_participant.trackings.length])
      end
      tracking
    end
end
