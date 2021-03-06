class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  private

    def user_must_be_logged_in
      unless logged_in?
        flash[:error] = "You must be logged in to view this page."
        redirect_to root_path
      end
    end

    def redirect_if_logged_in(action)
      if logged_in?
        flash[:error] = "Trying to find a bug in the program, are we? Nice try. You can't #{action} unless you're logged out."
        redirect_to user_path(current_user)
      end
    end

end
