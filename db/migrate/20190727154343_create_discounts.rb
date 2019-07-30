class CreateDiscounts < ActiveRecord::Migration[5.2]
  def change
    create_table :discounts do |t|
      t.string :name
      t.string :description
      t.integer :kind
      t.integer :status
      t.decimal :value

      t.timestamps
    end
  end
end
