class Discount < ApplicationRecord
  enum kind: [:percentage, :money]
  enum status: [:active, :inactive]
  has_many :sales

  accepts_nested_attributes_for :sales, reject_if: ->(attributes){ attributes['name'].blank? }, allow_destroy: true
end
