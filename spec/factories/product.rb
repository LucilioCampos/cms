FactoryBot.define do

  factory :product, class: Product do
    kind_id { create(:kind).id }
    description { Faker::Lorem::sentence(5) }
    status  { %i[active inactive].sample }
    price { 10.99 }
  end

end