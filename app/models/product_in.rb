class ProductIn < ApplicationRecord
  belongs_to :product, optional: true
end
