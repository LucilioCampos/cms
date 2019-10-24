FactoryBot.define do

  factory :product, class: Product do
    kind_id { create(:kind).id }
    description { Faker::Lorem::sentence(word_count: 5) }
    status  { %i[active inactive].sample }
    price { 10.99 }
  end

end