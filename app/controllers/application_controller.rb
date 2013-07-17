class ApplicationController < ActionController::Base
  protect_from_forgery

  include ApplicationHelper

  def login(user)
    token = SecureRandom.urlsafe_base64
    session[:session_token] = token
    user.session_token = token
    user.save!
  end

  

  def authenticate
    unless logged_in?
      flash[:error] = "you must be logged in!"
      redirect_to new_session_url
    end
  end

end
