class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])

    if user
      if user.validate_user(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: "Logged in successfully"
      else
        redirect_to new_sessions_path, alert: "Invalid Password"
      end
    else
      redirect_to new_sessions_path, alert: "Invalid Email"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged out successfully!"
  end
end
