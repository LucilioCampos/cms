FactoryBot.define do

  factory :user, class: User do
    name { Faker::Name.name}
    status { 'active' }
    kind { 'manager' }
    notes { Faker::Lorem.sentence(10) }
  end

end