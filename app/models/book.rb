class Book < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, dependent: :destroy
  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories
  has_one_attached :photo
  default_scope { order(created_at: :desc) }
end
