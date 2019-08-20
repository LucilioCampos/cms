class SaleSerializer < ActiveModel::Serializer
  attributes :id, :client_id, :user_id, :notes

  has_many :product_items
  has_one :sale_product
end
