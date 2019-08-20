class AddTotalPriceToSaleProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :sale_products, :total_price, :float
  end
end
