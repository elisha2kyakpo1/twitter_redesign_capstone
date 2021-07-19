class User < ApplicationRecord
  include UsersHelper
  has_many :tweets, foreign_key: :author_id, dependent: :destroy
  has_many :active_followings, class_name: 'Following', foreign_key: 'follower_id'
  has_many :passive_followings, class_name: 'Following', foreign_key: 'followed_id'
  has_many :votes, dependent: :destroy, foreign_key: :voter_id

  has_many :followeds, through: :active_followings, foreign_key: 'followed_id'
  has_many :followers, through: :passive_followings, foreign_key: 'follower_id'

  has_one_attached :photo
  has_one_attached :cover_image
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :full_name, presence: true, length: { minimum: 4, maximum: 50 }

  mount_uploader :photo, AvatarUploader
  mount_uploader :cover_image, CoverImageUploader
end
