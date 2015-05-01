class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  def require_user
    access_denied unless logged_in?
  end

  def require_same_user
    access_denied if current_user != @user
  end

  def access_denied
    flash[:error] = "Cannot perform this action."
    if logged_in?
      redirect_to user_collections_path(current_user)
    else
      redirect_to root_path
    end
  end

end
