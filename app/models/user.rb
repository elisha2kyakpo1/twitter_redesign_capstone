class User < ApplicationRecord
  has_many :tweets
  has_many :followers, dependent: :destroy, foreign_key: :followerId, class_name: 'Following'
  has_many :following, dependent: :destroy, foreign_key: :followedId, class_name: 'Following'
end
