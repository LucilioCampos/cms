FactoryBot.define do 
  service_array = ['Test Service', 'Test Service Two']
  letter = ['a', 'b', 'c', 'd']

  factory :random_users, class: User do
    name { Faker::Name.name}
    status { 'active' }
    kind { 'manager' }
    notes { Faker::Lorem.sentence(10) }
  end

  factory :random_kinds, class: Kind do
    name { Faker::Name.name }
    description { Faker::Lorem.sentence(2)}
  end
end

