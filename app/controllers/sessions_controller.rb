class SessionsController < ApplicationController
  require 'pry'

  def new
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash.alert = "Invalid username and/or password."
      render :new
    end
  end

  def destroy
  end
end