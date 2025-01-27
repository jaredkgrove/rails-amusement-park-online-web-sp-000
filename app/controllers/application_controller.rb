class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_if_not_logged_in
    redirect_to root_path if !logged_in?
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
end
