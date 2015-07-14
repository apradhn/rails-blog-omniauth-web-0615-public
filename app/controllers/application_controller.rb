class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private
  def login_required
    if !logged_in?
      redirect_to login_path, notice: "Log in to edit or delete your Post"
    end
  end

  def logged_in?
    if session[:user_id]
      if @current_user = User.find(session[:user_id])
        true
      else
        false
      end
    else
      false
    end
  end  
  helper_method :logged_in?

  def current_user
    @current_user
  end
  helper_method :current_user 

  def current_user=(current_user)
    @current_user = current_user
  end
end
