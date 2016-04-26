class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
  	User.where(id: session[:user_id]).first
  end

  helper_method :current_user

  def logged_in
  	if session[:user_id] == nil
  		redirect_to login_path
  	end
  end

  helper_method :logged_in


  def is_authorized(required_usertype)
  	user = User.find(session[:user_id])
  	if user.usertype != required_usertype
  		session[:user_id] = nil
  		redirect_to login_path
  	end
  end
end
