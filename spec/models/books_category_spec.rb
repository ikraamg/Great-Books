require 'rails_helper'

RSpec.describe BooksCategory, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:category_id) }
    it 'validates_presence_of_name' do
    bc = BooksCategory.new(book_id:nil, category_id:1)
    bc.valid?
    expect(bc.errors[:book].size).to eq(1)
end
  end

  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:category) }
  end
end
