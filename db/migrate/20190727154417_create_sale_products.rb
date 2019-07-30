class CreateSaleProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :sale_products do |t|
      t.integer :status
      t.integer :quantity
      t.references :sale, foreign_key: true

      t.timestamps
    end
  end
end
