class AddProductQuantityToProductItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_items, :product_quantity, foreign_key: true
  end
end
