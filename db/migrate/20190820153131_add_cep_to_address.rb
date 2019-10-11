class AddCepToAddress < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :cep, :string
  end
end
