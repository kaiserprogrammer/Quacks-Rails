class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :user_id

  def user_id
    session[:user_id]
  end
end
