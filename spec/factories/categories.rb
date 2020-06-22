FactoryBot.define do
  factory :category do
    name { Faker::Name.name  }
    priority { 1 }
  end
end
