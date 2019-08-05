class Phone < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :client, optional: true
  enum kind: [:fix, :comercial, :home]

  validates :kind, presence: true
  validates :num, presence: true
end
