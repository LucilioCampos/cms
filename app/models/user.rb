class User < ApplicationRecord
  has_many :addresses
  has_many :phones, inverse_of: :user
  has_many :sales
  has_many :documents
  has_many :traffic_statuses
  has_many :clients
  enum kind: [:manager, :salesman]
  enum status: [:active, :inactive]

  scope :search_name, -> (name) { where("name like ?", "#{name}%")}
  scope :campos, -> (filter) { select(filter) }

  accepts_nested_attributes_for :phones, allow_destroy: true

end
