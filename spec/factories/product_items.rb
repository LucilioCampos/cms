FactoryBot.define do
  factory :product_item do
    sale { nil }
    product { nil }
    status { 1 }
    total_price { 1.5 }
  end
end
