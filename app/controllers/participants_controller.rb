class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @participant.build_profession
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.token = SecureRandom.hex(32)

    if @participant.save && @participant.create_profession(profession_params[:profession_attributes])
      cookies[:auth_token] = { :value => @participant.token, :expires => Time.now + 2592000} # 30 days
      redirect_to instructions_path
    else
      @participant.build_profession(profession_params[:profession_attributes])
      render :new, :flash => { :error => "Couldn't create new participant." }
    end
  end

  def participant_params
    params.require(:participant).permit(:age, :web_usage, :gender, :computer_usage)
  end

  def profession_params
    params.require(:participant).permit(profession_attributes: [ :job_id, :additional])
  end


end
