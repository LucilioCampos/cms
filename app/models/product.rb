class Product < ApplicationRecord
  belongs_to :kind
  has_many :product_quantities
  has_many :product_ins
  has_many :product_outs
  has_one :product_create

  enum status: [:active, :inactive]
end
