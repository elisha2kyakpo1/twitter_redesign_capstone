module UsersHelper
  def avatar_thumbnail
    if avatar.attached?
      avatar.variant(resize: '50x50!').processed
    else
      '/default_avatar.jpg'
    end
  end
end
