class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :votes, dependent: :destroy, foreign_key: :tweet_id
  validates :text, length: { minimum: 1, maximum: 200 }, presence: true
  validates :author, presence: true
end
