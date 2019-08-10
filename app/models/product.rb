class Product < ApplicationRecord
  belongs_to :kind
  has_many :product_quantities
  has_many :product_ins
  has_many :product_outs

  enum status: [:active, :inactive]
end
