class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user.nil?
      flash[:error] = "that user doesn't exist"
      redirect_to new_session_url
      return
    end
    login(@user) if @user.authenticate(params[:user][:password])

    redirect_to (logged_in? ? user_url(@user.id) : new_session_url)
  end

  def destroy
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
