class AddNumToPhone < ActiveRecord::Migration[5.2]
  def change
    add_column :phones, :num, :string
  end
end
