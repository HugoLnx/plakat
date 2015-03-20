class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  #protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def current_user=(user_id)
    session[:current_user] = user_id
  end

  def current_user
    User.find session[:current_user]
  end

  def logged_in?
    session[:current_user] != nil
  end
end
