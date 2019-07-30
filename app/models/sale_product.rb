class SaleProduct < ApplicationRecord
  belongs_to :sale
  enum status: [:pending, :in_progress, :delivered]
end
