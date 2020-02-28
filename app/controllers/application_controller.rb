class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_user
  end

  private

    def authorization_error_and_redirect
      flash[:error] = "You are not authorized to access this page."
      redirect_to root_path
    end
end
