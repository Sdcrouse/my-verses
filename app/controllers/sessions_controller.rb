class SessionsController < ApplicationController
  def new
    if logged_in?
      flash[:error] = "Trying to find a bug in the program, are we? Nope, you can't log in unless you're logged out."
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.find_by(username: params[:username])

    if @user.try(:authenticate, params[:password])
      session[:user_id] = @user.id
      flash[:success] = "You are logged in!"
      redirect_to user_path(@user)
    else
      flash[:error] = "Invalid username and/or password."
      render :new
    end
  end

  def destroy
    if logged_in?
      session.destroy
      flash[:success] = "You have successfully logged out!"
      redirect_to login_path
    else # Edge case
      flash[:error] = "You can't log out unless you're logged in!"
      redirect_to login_path
    end
  end
end