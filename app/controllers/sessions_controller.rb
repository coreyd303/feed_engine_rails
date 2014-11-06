class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(env["omniauth.auth"])
    user.save
    session[:user_id] = user.id
    render :close_window
  end

end