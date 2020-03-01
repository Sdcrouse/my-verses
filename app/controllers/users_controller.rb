class UsersController < ApplicationController
  def new
    if logged_in?
      flash[:error] = "Nice try, Mr./Ms. Edge Case! You can't sign up unless you're logged out."
      redirect_to user_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    # I should probably have an email validation (besides presence) at some point.

    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}! Your new MyVerses account is all set up."
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = User.find_by(id: params[:id])
    else
      authorization_error_and_redirect
    end
  end

  private
    def user_params
      params.require(:user).permit(:username, :email, :first_name, :last_name, :password)
    end
end
