class UsersController < ApplicationController
  require 'pry'

  def new
    @user = User.new
  end

  def create
    # I should probably have an email validation (besides presence) at some point.

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
    end
end
