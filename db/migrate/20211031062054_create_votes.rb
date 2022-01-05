class CreateVotes < ActiveRecord::Migration[6.1]
  def change
    create_table :votes do |t|
      t.timestamps
    end
    add_column :votes, :voter_id, :integer, index: true
    add_foreign_key :votes, :users, column: :voter_id
    add_column :votes, :tweet_id, :integer, index: true
    add_foreign_key :votes, :tweets, column: :tweet_id
  end
end
