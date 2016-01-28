class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @participant.build_profession
  end

  def create
    @participant = Participant.new(participant_params)
    debugger
  end

  def participant_params
    params.require(:participant).permit(:age, :web_usage, :gender, profession_attributes: [ :job_id, :additional])
  end
end
