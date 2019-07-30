class Discount < ApplicationRecord
  enum kind: [:percentage, :money]
  enum status: [:active, :inactive]
end
