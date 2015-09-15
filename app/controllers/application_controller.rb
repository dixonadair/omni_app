class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # by declaring the above as a helper method, you can use it anywhere in your app (acc'ding to tutorial I'm currently watching)
  helper_method :current_user
end
