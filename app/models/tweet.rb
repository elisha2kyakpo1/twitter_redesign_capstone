class Tweet < ApplicationRecord
  belongs_to :user
  validates :Text, length: { minimum: 1, maximum: 1200 }, presence: true
end
