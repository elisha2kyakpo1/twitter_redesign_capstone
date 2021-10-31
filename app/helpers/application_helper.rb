module ApplicationHelper
  def vote_or_unvote_btn(tweet)
    vote = Vote.find_by(tweet: tweet, voter: current_user)
    if vote
      link_to('Unvote!', tweet_unvote_path(id: vote.id, tweet_id: tweet.id), method: :delete)
    else
      link_to('Vote!', tweet_vote_path(tweet_id: tweet.id), method: :get)
    end
  end
end