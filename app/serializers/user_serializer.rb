class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :kind, :notes, :phones
  has_many :phones
  
end
