class ProductQuantity < ApplicationRecord
  belongs_to :product
  validates_uniqueness_of :product
end
