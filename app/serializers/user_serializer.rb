class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :kind, :notes, :phones, :email
  has_many :phones
  has_many :addresses
  has_many :documents
end
