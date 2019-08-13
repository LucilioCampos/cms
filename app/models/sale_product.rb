class SaleProduct < ApplicationRecord
  belongs_to :sale
  enum status: [:pending, :payed]

  before_save do
    quantity = 0
    products = ProductItem.where(sale_id: self.sale_id)
    value = 0
    products.map do |product|
      value += product.total_price
      quantity += 1
    end
    self.total_price = value
    if self.status == 'payed'
      quan = ProductQuantity.where(product_id: self.productItem.product_id)
      quan.quantity - quantity
    end
  end

end
