FactoryBot.define do

  factory :discount, class: Discount do
    name { Faker::FunnyName.name }
    description { Faker::Lorem.sentence(3) }
    kind { %i[percentage money].sample }
    status { %i[active inactive].sample }
    value { rand(1..10) }
  end

end