require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:priority) }
  end
  describe 'associations' do
    it { should have_many(:books_categories).dependent(:destroy) }
    it { should have_many(:books).through(:books_categories) }
  end
end
