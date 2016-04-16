class Backend::ParticipantsController < Backend::ApplicationController
  def index
    @participants = Participant.all

    respond_to do |format|
      format.html
      format.csv { send_data Participant.as_csv(false), filename: "participants-#{Date.today}.csv" }
    end
  end

  def export
    Participant.delay.as_csv(export_params[:mail])
    redirect_to backend_root_path
  end

  def export_comments
    column_fields = ["case", "comment"]

    question = Question.where(label: "Anmerkungen").first

    csv = CSV.generate do |csv|
      csv << column_fields
      question.answers.each do |answer|
        csv << [answer.case_id, answer.text.gsub("\r\n", " ").gsub("\"", "'")] if answer.text.present?
      end
    end

    respond_to do |format|
      format.csv { send_data csv, filename: "comments-#{Date.today}.csv" }
    end
  end

  def show
    @participant = Participant.find(params[:id])
  end

  def export_params
    params.require(:user).permit(:mail)
  end
end
