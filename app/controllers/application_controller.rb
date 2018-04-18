class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_login
    unless session[:user_id].present?
      redirect_to new_session_path
    end
  end
  before_action :require_login
end
