FactoryBot.define do

  factory :document_user, class: Document do
    kind { %i[cpf rg cne].sample }
    num { Faker::IDNumber.valid }
    user_id { create(:user).id }
  end

  factory :document_client, class: Document do
    kind { %i[cpf rg cne].sample }
    num { Faker::IDNumber.valid }
    client_id { create(:client).id }
  end

  factory :document, class: Document do
    kind { %i[cpf rg cne].sample }
    num { Faker::IDNumber.valid }
  end

end