class SessionsController < ApplicationController
  def create
    user = User.find_by_username(params[:username])
    if user
      session[:author_id] = user.id
      redirect_to tweets_path, notice: 'Logged in succussfully!'
    else
      render 'new', alert: 'The name is invalid'
    end
  end

  def logout_user
    session[:author_id] = nil
    redirect_to root_path, notice: 'Logged out succussfully!'
  end
end
