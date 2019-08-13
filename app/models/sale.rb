class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  has_many :product_items

  validates_presence_of :client, :user

  accepts_nested_attributes_for :product_items

end
