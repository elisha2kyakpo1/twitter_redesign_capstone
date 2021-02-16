class FollowingsController < ApplicationController
  def index
    @followers = Following.order('created_at DESC')
  end

  private

  def follow_params
    params.require(:follow).permit(:followed_id)
  end
end
