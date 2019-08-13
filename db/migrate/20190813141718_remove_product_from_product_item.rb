class RemoveProductFromProductItem < ActiveRecord::Migration[5.2]
  def change
    remove_reference :product_items, :product, foreign_key: true
  end
end
