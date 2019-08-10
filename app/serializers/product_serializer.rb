class ProductSerializer < ActiveModel::Serializer
  attributes :id, :kind_id, :description, :status, :price
end
