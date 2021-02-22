class FollowingsController < ApplicationController
  def index
    @followings = Following.all
  end

  def follow
    @user = User.find(params[:id])
    current_user.follow(@user).save
    redirect_to users_path
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to users_path
  end
end
