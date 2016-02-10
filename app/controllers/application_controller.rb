class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :force_user_to_journey

  before_filter :set_cache_headers

  private

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def force_user_to_journey
    return if action_name == "debug" or controller_name == "settings"

    if Setting.find_by_name("app").maintenance
      render "content/pause" # for maintenance
      return
    end

    @force_user = true


    if cookies[:auth_token] && @current_participant = Participant.find_by_token(cookies[:auth_token])
      return if controller_name == "content" && action_name == "instructions"
      if @force_user && !@current_participant.completed? && controller_name != "cases"
        redirect_to handle_case_path
      end
    elsif @force_user && ((controller_name != "content" && controller_name != "participants") or
      controller_name == "content" && action_name == "completed")
        redirect_to root_path
    end
  end
end
