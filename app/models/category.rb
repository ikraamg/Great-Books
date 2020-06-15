class Category < ApplicationRecord
  has_many :books_categories
  has_many :books, through: :books_categories
  default_scope { order(priority: :asc)}
end
