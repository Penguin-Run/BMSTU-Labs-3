class ApplicationController < ActionController::Base
	before_action :set_locale

  helper_method :authenticate
	helper_method :current_user

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options = {})
    { locale: I18n.locale }.merge options
  end

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
