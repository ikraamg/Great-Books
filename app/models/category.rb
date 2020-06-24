class Category < ApplicationRecord
  has_many :books_categories, dependent: :destroy
  has_many :books, through: :books_categories
  default_scope { order(priority: :asc) }
  validates :name, presence: true
  validates :priority, presence: true
end
