class UsersController < ApplicationController
  def index
    @users = User.order('created_at DESC')
    @tweets = Tweet.order('created_at DESC')
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets.order('created_at DESC')
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

  def follow_user
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to users_path
  end

  def unfollow_user
    @user = User.find(params[:id])
    current_user.unfollow(@user)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullName, :photo, :cover_image)
  end
end
