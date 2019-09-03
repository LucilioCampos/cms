FactoryBot.define do

  factory :user, class: User do
    name { Faker::Name.name}
    email { Faker::Internet.email }
    password { '123456' }
    status { 'active' }
    kind { 'manager' }
    notes { Faker::Lorem.sentence(10) }
  end

end