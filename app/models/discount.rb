class Discount < ApplicationRecord
  enum kind: [:percentage, :money]
  enum status: [:active, :inactive]

  has_many :product_item
end
