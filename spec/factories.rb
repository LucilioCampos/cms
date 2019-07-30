FactoryBot.define do 
  service_array = ['Test Service', 'Test Service Two']
  letter = ['a', 'b', 'c', 'd']

  factory :random_users, class: User do
    name { Faker::Name.name}
    status { 'active' }
    kind { 'manager' }
    notes { Faker::Lorem.sentence(10) }
  end
end

