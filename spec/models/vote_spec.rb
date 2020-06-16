require 'rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:book_id) }
    it { should validate_presence_of(:user_id) }
  end
  describe 'associations' do
    it { should belong_to(:book).counter_cache(:votes_count) }
    it { should belong_to(:user) }
  end
end
