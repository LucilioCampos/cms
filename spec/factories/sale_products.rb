FactoryBot.define do
  factory :sale_product do
    sale { nil }
    status { 1 }
    total_price { 1 }
  end
end
