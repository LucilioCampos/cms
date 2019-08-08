FactoryBot.define do
  factory :phone_with_client, class: Phone do
    kind { %i[fix comercial home].sample }
    client_id { create(:client).id }
    num { Faker::PhoneNumber.phone_number }
  end

  factory :phone_with_user, class: Phone do
    kind { %i[fix comercial home].sample }
    user_id { create(:user).id }
    num { Faker::PhoneNumber.phone_number }
  end

  factory :phone, class: Phone do
    kind { %i[fix comercial home].sample }
    num { Faker::PhoneNumber.phone_number }
  end

  factory :phone_client_user, class: Phone do
    kind { %i[fix comercial home].sample }
    user_id { create(:user).id }
    client_id { create(:client).id }
    num { Faker::PhoneNumber.phone_number } 
  end

end