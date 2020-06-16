require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:author_id) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:text) }
  end

  describe 'associations' do
    it { should have_many(:books_categories).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:categories).through(:books_categories) }
    it { should belong_to(:user).class_name('User').with_foreign_key(:author_id) }

  end
end
