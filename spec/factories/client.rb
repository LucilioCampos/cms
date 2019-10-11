FactoryBot.define do
  factory :client, class: Client do
    name { Faker::Name.name }
    company { Faker::Company.name }
    email { Faker::Internet.email }
    user { FactoryBot.create(:user) }
    notes { Faker::Lorem.sentence(5) }
    status { :active }
  end
end