require 'rails_helper'

RSpec.describe BooksCategory, type: :model do

   describe 'validations' do
    it { should validate_presence_of(:category_id) }
  end

  describe 'associations' do
    it { should belong_to(:book) }
    it { should belong_to(:category) }
  end
end
