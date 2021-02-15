class AddPhotoToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :Photo, :string
    add_column :users, :CoverImage, :string
  end
end
