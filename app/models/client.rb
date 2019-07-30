class Client < ApplicationRecord
  belongs_to :user
  enum status: [:active, :inactive]
  has_many :phones
  has_many :addresses
end
