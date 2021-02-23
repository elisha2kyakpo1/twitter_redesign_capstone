class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }

  belongs_to :voter, class_name: 'User'
  belongs_to :tweet
end
