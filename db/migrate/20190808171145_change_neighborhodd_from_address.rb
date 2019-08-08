class ChangeNeighborhoddFromAddress < ActiveRecord::Migration[5.2]
  def change
    create_table "addresses", force: :cascade do |t|
      t.integer "state"
      t.string "city"
      t.string "neighborhood"
      t.string "street"
      t.text "notes"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.bigint "client_id"
      t.bigint "user_id"
      t.index ["client_id"], name: "index_addresses_on_client_id"
      t.index ["user_id"], name: "index_addresses_on_user_id"
    end
  end
end
