class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :authenticate

  private
  def authenticate
    if session[:user_id].present?
      @current_user = User.find_by :id => session[:user_id]
    end
    # the session id will be nil unless there is a current user
    session[:user_id] = nil unless @current_user.present?
  end
end
