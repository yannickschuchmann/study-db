class ParticipantsController < ApplicationController
  def new
    @participant = Participant.new
    @participant.build_profession
  end

  def create
    @participant = Participant.new(participant_params)
    @participant.token = SecureRandom.hex(32)
    @participant.sheet_order = (1..Case.sheets).to_a.shuffle.to_s

    if @participant.save! && @participant.create_profession(profession_params[:profession_attributes])
      cookies[:auth_token] = { :value => @participant.token, :expires => Time.now + 2592000} # 30 days
      redirect_to test_case_path
    else
      redirect_to new_participant_path, :flash => { :error => "Couldn't create new participant." }
    end
  end

  def feelings
    @questionary = Questionary.find_by_name("attrakdiff")
  end

  def create_feelings
    answerData = params.permit![:answers]
    answers = []
    answerData.each do |a|
      answerData[a][:participant_id] = @current_participant.id
      answers << answerData[a]
    end

    if Answer.create(answers)
      @current_participant.feelings_filled = true
      if @current_participant.save
        redirect_to completed_path
      else
        redirect_to feelings_participant_path, :flash => {:error => "Couldn't update participant."}
      end
    else
      redirect_to feelings_participant_path, :flash => {:error => "Couldn't create answers."}
    end
  end

  def participant_params
    params.require(:participant).permit(:age, :web_usage, :gender)
  end

  def profession_params
    params.require(:participant).permit(profession_attributes: [ :job_id, :additional])
  end


end
