class SessionsController < ApplicationController
  def new
    # @user = User.new
  end

  def create
    @user = User.find_or_create_from_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to '/login'
  end
end
