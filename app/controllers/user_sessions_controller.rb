class UserSessionsController < ApplicationController
  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = 'Logged in successfully!'
      redirect_to root_path
    else
      flash[:error] = 'Failed to log in!'
      render :action => 'new'
    end
  end

  def destroy
    current_user_session.destroy
    flash[:notice] = "Logged out successfully!"
    redirect_to login_path
  end
end
