require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
  end
   describe 'associations' do
    it { should have_many(:votes).dependent(:destroy) }
    it { should have_many(:books).class_name('Book').with_foreign_key(:author_id).dependent(:destroy) }
  end
end
