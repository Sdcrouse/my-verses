class SessionsController < ApplicationController
  require 'pry'

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: params[:user][:username])

    if @user.try(:authenticate, params[:user][:password])
      session[:user_id] = @user.id
      binding.pry
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def destroy
  end
end