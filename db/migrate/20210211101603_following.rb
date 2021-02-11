class Following < ActiveRecord::Migration[6.1]
  def change
    add_column :following, :followerId, :integer, index: true
    add_foreign_key :following, :users, column: :followerId
    
    add_column :following, :followedId, :integer, index: true
    add_foreign_key :following, :users, column: :followedId
  end
end
