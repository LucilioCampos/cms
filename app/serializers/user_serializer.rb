class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :kind, :notes, :phones
  has_many :phones
  has_many :addresses
end
