class ApplicationController < ActionController::Base
	helper_method :authenticate
	helper_method :current_user

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
    return @current_user
  end

  def authenticate
    redirect_to login_path unless current_user
  end
end
