class DiscountSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :kind, :status, :value
end
