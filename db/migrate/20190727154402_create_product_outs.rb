class CreateProductOuts < ActiveRecord::Migration[5.2]
  def change
    create_table :product_outs do |t|
      t.references :product, foreign_key: true
      t.references :traffic, foreign_key: true

      t.timestamps
    end
  end
end
