class Backend::ParticipantsController < Backend::ApplicationController
  def index
    @participants = Participant.all
  end

  def show
    @participant = Participant.find(params[:id])
  end
end
