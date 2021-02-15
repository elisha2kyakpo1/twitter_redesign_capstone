class UsersController < ApplicationController
  def index
    @users = User.order('created_at DESC')
    @tweets = Tweet.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at DESC')
    @followers = @user.followers
    @following = @user.following
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to edit_user_path
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
    @user = Post.find(params[:id])
    @user.destroy

    redirect_to users_path
  end

  def create_follow
    @user = User.find(params[:id])
    @follower = current_user.follow(@user)
  end

  def destroy_friendship
    @user = User.find(params[:id])
    @follower = current_user.unfollow(@user)
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullName)
  end
end
