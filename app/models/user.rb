class User < ApplicationRecord
  include UsersHelper
  has_many :tweets, foreign_key: :author_id, dependent: :destroy
  has_many :active_followers, dependent: :destroy, foreign_key: :follower_id, class_name: 'Following'
  has_many :following, through: :active_followers, source: :followed
  has_many :passive_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_followers, source: :followed
  has_many :followers, through: :passive_followings, source: :follower
  has_one_attached :Photo
  has_one_attached :coverimage
  # include ImageUploader::Attachment(:photo, :cover_image)

  validates :username, presence: true, uniqueness: true, length: { maximum: 20 }
  validates :fullName, presence: true, uniqueness: true, length: { maximum: 50 }

  # after_commit :add_default_avatar, on: %i[create update]
end
