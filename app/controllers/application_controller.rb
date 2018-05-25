class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    if !current_user
      flash[:message] = "You need to authorize Twitter to perform this action"
      redirect_to '/login'
    end
  end

  helper_method :current_user
end
