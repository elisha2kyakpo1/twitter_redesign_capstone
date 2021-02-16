class User < ApplicationRecord
  has_many :tweets, foreign_key: :author_id, dependent: :destroy
  has_many :active_followers, dependent: :destroy, foreign_key: :follower_id, class_name: 'Following'
  has_many :following, through: :active_followers, source: :followed
  has_many :passive_followings, class_name: 'Following', foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_followers, source: :followed
  has_many :followers, through: :passive_followings, source: :follower
  has_one_attached :avatar

  validates :username, presence: true, uniqueness: true
  validates :fullName, presence: true, uniqueness: true

  # after_commit :add_default_avatar, on: %i[create update]

  def follow(user)
    active_followers.create(followed_id: user.id)
  end

  def unfollow(user)
    active_followers.find_by(followed_id: user.id).destroy
  end

  def following?(user)
    following.include?(user)
  end

  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '50x50!').processed
    else
      '/default_avatar.jpg'
    end
  end

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
