FactoryBot.define do

  factory :address, class: Address do
    state {
      [ 
        "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
        "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
        "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
      ].sample
    }
    city { Faker::Address.city }
    neighborhood { Faker::Address.street_name }
    street { Faker::Address.street_name }
    notes { Faker::Lorem.sentence(word_count: 5) }
  end

  factory :address_with_user, class: Address do
    state {
      [ 
        "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
        "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
        "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
      ].sample
    }
    city { Faker::Address.city }
    neighborhood { Faker::Address.street_name }
    street { Faker::Address.street_name }
    notes { Faker::Lorem.sentence(word_count: 5) }
    user_id { create(:user).id }
  end

  factory :address_with_client, class: Address do
    state {
      [ 
        "AC", "AL", "AM", "AP", "BA", "CE", "DF", "ES", "GO", 
        "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", 
        "RJ", "RN", "RO", "RS", "RR", "SC", "SE", "SP", "TO"
      ].sample
    }
    city { Faker::Address.city }
    neighborhood { Faker::Address.street_name }
    street { Faker::Address.street_name }
    notes { Faker::Lorem.sentence(word_count: 5) }
    client_id { create(:client).id }
  end

end