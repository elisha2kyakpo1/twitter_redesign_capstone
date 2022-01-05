class AddAuthorIdToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :author_id, :integer, index: true
    add_foreign_key :tweets, :users, column: :author_id
  end
end
