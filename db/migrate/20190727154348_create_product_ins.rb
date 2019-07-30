class CreateProductIns < ActiveRecord::Migration[5.2]
  def change
    create_table :product_ins do |t|
      t.references :product, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
