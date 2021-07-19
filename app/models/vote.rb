class Vote < ApplicationRecord
  validates :voter_id, uniqueness: { scope: :tweet_id }

  belongs_to :voter, class_name: 'User'
  belongs_to :tweet
end
