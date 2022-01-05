class AddFollowerIdFollowing < ActiveRecord::Migration[6.1]
  def change
    add_column :followings, :follower_id, :integer, index: true
    add_foreign_key :followings, :users, column: :follower_id

    add_column :followings, :followed_id, :integer, index: true
    add_foreign_key :followings, :users, column: :followed_id
    add_index :followings, %i[follower_id followed_id], unique: true
  end
end
