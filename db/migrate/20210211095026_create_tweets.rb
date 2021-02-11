class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :Text
      t.references :user, null: false, foreign_key: true
      t.datetime :CreatedAt

      t.timestamps
    end
  end
end
