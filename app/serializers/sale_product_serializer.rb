class SaleProductSerializer < ActiveModel::Serializer
  attributes :id, :sale_id, :status, :total_price
end
