class BooksCategory < ApplicationRecord
  belongs_to :book
  belongs_to :category
  validates :category_id, presence: true
end
