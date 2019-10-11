FactoryBot.define do

  factory :kind, class: Kind do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(2) }
  end
end