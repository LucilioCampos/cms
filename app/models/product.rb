class Product < ApplicationRecord
  belongs_to :kind
  has_many :product_quantities
  has_many :product_ins
  has_many :product_outs
  has_one :product_create

  enum status: [:active, :inactive]

  accepts_nested_attributes_for :product_quantities, reject_if: ->(attributes){ attributes['quantity'].blank? }
end
