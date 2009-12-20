class UsersController < ApplicationController
  layout 'application'

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    flash[:notice] = 'Registration successful'
    redirect_to root_url
  end

end
