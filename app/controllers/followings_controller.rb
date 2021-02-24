class FollowingsController < ApplicationController
  def index
    @followings = Following.all
  end
end
