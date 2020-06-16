class Vote < ApplicationRecord
  validates :user_id, uniqueness: { scope: :book_id }, presence: true
  validates :book_id, presence: true
  belongs_to :user
  belongs_to :book, counter_cache: :votes_count
end
