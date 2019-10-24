FactoryBot.define do
  factory :client, class: Client do
    name { Faker::Name.name }
    company { Faker::Company.name }
    email { Faker::Internet.email }
    user { FactoryBot.create(:user) }
    notes { Faker::Lorem.sentence(word_count: 5) }
    status { :active }
  end
end