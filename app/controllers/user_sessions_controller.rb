class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    flash[:notice] = 'Logged in successfully!'
    redirect_to root_path
  end
end
