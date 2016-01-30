class CasesController < ApplicationController
  def handle

    redirect_to completed_path if @current_participant.trackings.length == Case.count and
        @current_participant.trackings.last.try(:completed)

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

  end

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
