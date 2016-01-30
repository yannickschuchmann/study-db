class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :force_user_to_journey

  def force_user_to_journey
    if cookies[:auth_token]
      @current_participant = Participant.find_by_token(cookies[:auth_token])
      if @current_participant.cases.length < Case.count && controller_name != "cases"
        redirect_to handle_case_path
      end
    end
  end
end
