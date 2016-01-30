class CasesController < ApplicationController
  def handle
    @case = Case.all[@current_participant.cases.length]

    if @case.trackings.where(participant_id: @current_participant.id).length > 0 && action_name != "answer"
      redirect_to answer_case_path
    elsif action_name != "test"
      redirect_to test_case_path
    end
  end

  def test
    handle
  end

  def answer
    handle
  end
end
