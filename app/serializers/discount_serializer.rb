class DiscountSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :kind, :status, :value
  has_many :sales
end
