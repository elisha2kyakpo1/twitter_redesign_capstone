class AddPhotoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :photo, :binary
    add_column :users, :cover_image, :binary
  end
end
