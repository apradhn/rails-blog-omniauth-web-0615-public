class SessionsController < ApplicationController
  def create
    @user = User.create_with_omniauth(auth_hash)
    self.current_user = @user
    session[:user_id] = @user.id
    redirect_to "/"
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "Logged Out"
  end

  protected
  def auth_hash
    request.env['omniauth.auth']
  end
end
