class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.references :kind, foreign_key: true
      t.string :description
      t.integer :status
      t.decimal :price

      t.timestamps
    end
  end
end
