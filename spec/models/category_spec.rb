require 'rails_helper'

RSpec.describe Category, type: :model do
  it { should have_many(:books_categories) }
  it { should have_many(:books).through(:books_categories) }
end
