class UsersController < ApplicationController
  def index
    @users = User.all.includes(:followeds, :followers, :tweets, :votes)
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])

    @user_tweets = @user.tweets.includes(:author).order('created_at DESC')
    @followers = @user.followers
    @followings = @user.followeds
    @user_followed_by = @user.followers
    @user_followers = @user.followeds
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:author_id] = @user.id
      redirect_to tweets_path,
                  notice: "Hi #{@user.username}, you successfully Signed up!"
    else
      render 'new', notice: 'This username is taken!'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def follow_user
    @user = User.find(params[:id])
    current_user.follow(@user).save
    redirect_to user_path
  end

  def unfollow_user
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to user_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end
end
