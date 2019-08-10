class Discount < ApplicationRecord
  enum kind: [:percentage, :money]
  enum status: [:active, :inactive]
  belongs_to :sale, optional: true
end
