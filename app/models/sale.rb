class Sale < ApplicationRecord
  belongs_to :client
  belongs_to :user
  belongs_to :discount
  has_one :client
  has_one :discount, optional: true
  has_one :user
  has_one :traffic_statuses
end
