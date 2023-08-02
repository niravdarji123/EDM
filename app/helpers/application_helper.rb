module ApplicationHelper
  def current_user
    # For this example, we are assuming a single user with ID 1
    @current_user ||= User.find_by_id(session[:user_id])
  end
end
