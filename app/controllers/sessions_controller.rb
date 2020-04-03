class SessionsController < ApplicationController
  def new
    redirect_if_logged_in("log in") and return
  end

  def create
    @user = User.find_by(email: params[:email])
    # Here, I am assuming that no two users have the same email, and that the same user has only one account.

    if @user.try(:authenticate, params[:password])
      login_user(@user)
    else
      flash.now[:error] = "Invalid email and/or password."
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

  def fb_login
    user = User.from_fb_omniauth(auth_info)
    user.save
    login_user(user)

    # I could add an error message here, but that would be a seldom-encountered edge case.
  end

  private

    def auth_info
      request.env['omniauth.auth']['info']
    end

    def login_user(user)
      session[:user_id] = user.id
      flash[:success] = "You are logged in!"
      redirect_to user_path(user)
    end
end