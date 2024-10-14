module RegHelper
  def logged_in?
    session[:user_id].present?  # this checks if the user_id exists
  end

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id].present?  # this updates the current_user var if its not already assigned and if user_id is not empty
  end
end
