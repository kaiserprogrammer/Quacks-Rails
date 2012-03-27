class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    au = AddUser.new(auth["info"]["name"], auth["info"]["nickname"], DB.new)
    au.execute
    session[:user_id] = au.user_id
    redirect_to root_url, :notice => "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out"
  end
end
