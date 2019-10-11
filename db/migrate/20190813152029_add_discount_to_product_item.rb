class AddDiscountToProductItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_items, :discount, foreign_key: true
  end
end
