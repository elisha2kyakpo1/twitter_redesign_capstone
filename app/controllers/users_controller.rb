class UsersController < ApplicationController
  def index
    @users = User.all
    @tweets = Tweet.all
  end

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
    @tweets = @user.tweets
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

  def followers
    @user = User.find(params[:user])
    @followers = @user.followers(User)
    @users = User.all

    response = { user: @user, followers: @followers, users: @users }

    respond_to do |format|
      format.html
      format.xml { render xml: response }
    end
  end

  def following
    @user = User.find(params[:username])
    @following = @user.followed(User)
    @users = User.all

    response = { user: @user, following: @following, users: @users }

    respond_to do |format|
      format.html # following.html.erb
      format.xml { render xml: response }
    end
  end

  def unfollow(following)
    following.find_by(followed_id: followings.id).destroy
  end

  private

  def user_params
    params.require(:user).permit(:username, :fullName)
  end
end
