class AddSaleToTrafficStatus < ActiveRecord::Migration[5.2]
  def change
    add_reference :traffic_statuses, :sale, foreign_key: true
  end
end
