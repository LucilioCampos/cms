class AddProductToProductItem < ActiveRecord::Migration[5.2]
  def change
    add_reference :product_items, :product, foreign_key: true
  end
end
