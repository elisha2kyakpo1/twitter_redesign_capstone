module UsersHelper
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
    if photo.attached?
      photo.variant(resize: '50x50!').processed
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
