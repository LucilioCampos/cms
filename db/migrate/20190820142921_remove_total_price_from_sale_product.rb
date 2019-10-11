class RemoveTotalPriceFromSaleProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :sale_products, :total_price, :integer
  end
end
