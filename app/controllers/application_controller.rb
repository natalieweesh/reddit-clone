class ApplicationController < ActionController::Base
  protect_from_forgery

  def login(user)
    token = SecureRandom.urlsafe_base64
    session[:session_token] = token
    user.session_token = token
    user.save!
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !!current_user
  end

  def authenticate
    unless logged_in?
      flash[:error] = "you must be logged in!"
      redirect_to new_session_url
    end
  end

end
