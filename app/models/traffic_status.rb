class TrafficStatus < ApplicationRecord
  belongs_to :traffic
  belongs_to :client
  belongs_to :user
  belongs_to :sale
end
