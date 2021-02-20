class Tweet < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :text, length: { minimum: 1, maximum: 200 }, presence: true
  validates :author, presence: true
end
