class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :state
      t.string :city
      t.string :neighborhood
      t.string :street
      t.text :notes

      t.timestamps
    end
  end
end
