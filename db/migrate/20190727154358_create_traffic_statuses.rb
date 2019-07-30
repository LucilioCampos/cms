class CreateTrafficStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :traffic_statuses do |t|
      t.references :traffic, foreign_key: true
      t.references :client, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
