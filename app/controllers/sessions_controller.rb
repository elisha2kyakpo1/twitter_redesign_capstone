class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_username(params[:username])
    if user
      session[:author_id] = user.id
      redirect_to tweets_path, notice: 'Logged in succussfully!'
    else
      render 'new', notice: 'The name is invalid'
    end
  end

  def logout_user
    session[:author_id] = nil
    redirect_to root_path, notice: 'Logged out succussfully!'
  end
end
