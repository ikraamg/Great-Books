class Book < ApplicationRecord
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, dependent: :destroy
  has_many :books_categories, dependent: :destroy
  has_many :categories, through: :books_categories
  has_one_attached :photo

  validates :author_id, presence: true
  validates :title, presence: true
  validates :text, presence: true

  scope :order_by_newest, -> { order(created_at: :desc) }
  scope :with_photo, -> { includes(photo_attachment: :blob) }
  scope :with_user, -> { includes(:user) }
  scope :with_categories, -> { includes(:categories) }
  scope :created_by, ->(the_user) { where(author_id: the_user.id) }
end
