class CreateProductItems < ActiveRecord::Migration[5.2]
  def change
    create_table :product_items do |t|
      t.references :sale, foreign_key: true
      t.references :product, foreign_key: true
      t.integer :status
      t.float :total_price

      t.timestamps
    end
  end
end
