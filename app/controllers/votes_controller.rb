class VotesController < ApplicationController
  def vote
    @vote = current_user.votes.new(tweet_id: params[:tweet_id])

    if @vote.save
      redirect_to root_path, notice: 'You voted a tweet.'
    else
      redirect_to root_path, alert: 'You cannot vote this tweet.'
    end
  end

  def unvote
    vote = Vote.find_by(id: params[:id], voter: current_user, tweet_id: params[:tweet_id])
    if vote
      vote.destroy
      redirect_to root_path, notice: 'You unvoted a tweet.'
    else
      redirect_to root_path, alert: 'You cannot unvote twwet that you did not vote before.'
    end
  end
end
