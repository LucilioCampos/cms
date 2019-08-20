class ProductItemSerializer < ActiveModel::Serializer
  attributes :id, :status, :total_price, :discount_id
end
