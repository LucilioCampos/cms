class SaleProduct < ApplicationRecord
  belongs_to :sale
  enum status: [:pending, :payed]
  before_save :update_sale_product
  before_create :create_sale_product


  private
  def update_sale_product
    calc_quantity
    calc_total_price
    self.total_price = self.total_price.round(2)
    if self.status == :payed
      itens = ProductItem.where(sale_id: self.sale_id)
      itens.map { |item| item.status = :payed }
    end
  end

  def create_sale_product
    calc_total_price
    self.status = :pending
  end

  def calc_total_price
    quantity = 0
    products = ProductItem.where(sale_id: self.sale_id)
    value = 0
    products.map do |product|
      value += product.total_price
      quantity += 1
    end
    self.total_price = value.round(2)
  end

  def calc_quantity
    products = ProductItem.where(sale_id: self.sale_id)
    if self.status == :payed
      con = 0
      products.map do product
        dec = ProductQuantity.where(id: product.id)
        dec.quantity -= product.quantity
      end
    end
  end

end
