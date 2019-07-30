class ProductOut < ApplicationRecord
  belongs_to :product, optional: true
  belongs_to :traffic
end
