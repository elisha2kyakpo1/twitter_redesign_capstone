class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id
  has_many :followers, dependent: :destroy, foreign_key: :follower_id, class_name: 'Following'
  has_many :followings, foreign_key: :followed_id, class_name: 'Following'
  has_many_attached :avatar

  validates :username, presence: true, uniqueness: true
  validates :fullName, presence: true, uniqueness: true
  after_commit :add_default_avatar, on: %i[create update]

  private

  def add_default_avatar
    return if avatar.attached?

    avatar.attach(
      io: File.open(
        Rails.root.join(
          'app', 'assets', 'images', 'default.jpg'
        )
      ), filename: 'default_avatar.jpg',
      content_type: 'image/jpg'
    )
  end
end
