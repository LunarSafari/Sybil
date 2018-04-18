class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by_name(params[:credentials][:name])&.authenticate(params[:credentials][:password])
    if user.present?
      session[:user_id] = user.id
    end
    redirect_to root_path
  end

  def destroy
    session.delete :user_id
    redirect_to root_path
  end
end
