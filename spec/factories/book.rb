FactoryBot.define do
  factory :book do
    author_id { 1 }
    title { Faker::Name.name  }
    text { Faker::Lorem.paragraph(sentence_count: 10)  }
  end
end
