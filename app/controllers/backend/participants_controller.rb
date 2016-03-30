class Backend::ParticipantsController < Backend::ApplicationController
  def index
    @participants = Participant.all

    respond_to do |format|
      format.html
      # format.csv { send_data Participant.as_csv("yann@asd.de"), filename: "participants-#{Date.today}.csv" }
    end
  end

  def export
    Participant.delay.as_csv(export_params[:mail])
    redirect_to backend_root_path
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def export_params
    params.require(:user).permit(:mail)
  end
end
