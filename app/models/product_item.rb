class ProductItem < ApplicationRecord
  belongs_to :sale
  belongs_to :discount, optional: true
  enum status: [:pending, :payed]

  before_save do
    value = 0
    if self.discount_id
      debugger
      discount = Discount.where(id: self.discount_id).first
      if discount.kind == 'percentage'
        value = (self.total_price * discount.value) / 100
      elsif discount.kind == 'money'
        value = self.total_price - discount.value
      end
      self.total_price = value.round(2)
    end
  end
end
