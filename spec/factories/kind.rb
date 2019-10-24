FactoryBot.define do

  factory :kind, class: Kind do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(word_count: 2) }
  end
end