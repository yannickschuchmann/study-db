class Backend::ParticipantsController < Backend::ApplicationController
  def index
    @participants = Participant.all

    respond_to do |format|
      format.html
      format.csv { send_data @participants.to_csv, filename: "participants-#{Date.today}.csv" }
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end
end
