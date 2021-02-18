class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :Text, length: { minimum: 1, maximum: 200 }, presence: true
end
