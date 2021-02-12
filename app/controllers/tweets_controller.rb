class TweetsController < ApplicationController
  before_action :require_login, only: %i[index]
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all
  end

  def show; end

  def new
    @tweet = Tweet.new
  end

  def edit; end

  # def create
  #   @tweet = Tweet.new(tweet_params)

  #   respond_to do |format|
  #     if @tweet.save
  #       format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
  #       format.json { render :show, status: :created, location: @tweet }
  #     else
  #       format.html { render :new, status: :unprocessable_entity }
  #       format.json { render json: @tweet.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  def create
    @tweet = current_user.tweets.build(tweet_params)

    if @tweet.save
      redirect_to root_path,
                  notice: 'Tweet created succussfully!'
    else
      render 'new'
    end
  end

  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { render :show, status: :ok, location: @tweet }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url, notice: 'Tweet was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:Text, :author_id)
  end
end
