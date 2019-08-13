class ProductItemSerializer < ActiveModel::Serializer
  attributes :id, :sale_id, :status, :total_price, :discount_id
end
