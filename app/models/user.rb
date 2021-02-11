class User < ApplicationRecord
  has_many :tweets
  has_many :followers, dependent: :destroy, foreign_key: :follower_id, class_name: 'Following'
  has_many :followings, foreign_key: :followed_id, class_name: 'Following'
end
