# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_08_10_142637) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "company"
    t.string "email"
    t.bigint "user_id"
    t.text "notes"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_clients_on_user_id"
  end

  create_table "discounts", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.integer "kind"
    t.integer "status"
    t.decimal "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "documents", force: :cascade do |t|
    t.integer "kind"
    t.string "num"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_documents_on_client_id"
    t.index ["user_id"], name: "index_documents_on_user_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", force: :cascade do |t|
    t.integer "kind"
    t.bigint "user_id"
    t.bigint "client_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "num"
    t.index ["client_id"], name: "index_phones_on_client_id"
    t.index ["user_id"], name: "index_phones_on_user_id"
  end

  create_table "product_ins", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_ins_on_product_id"
  end

  create_table "product_outs", force: :cascade do |t|
    t.bigint "product_id"
    t.bigint "traffic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_outs_on_product_id"
    t.index ["traffic_id"], name: "index_product_outs_on_traffic_id"
  end

  create_table "product_quantities", force: :cascade do |t|
    t.bigint "product_id"
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["product_id"], name: "index_product_quantities_on_product_id"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "kind_id"
    t.string "description"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "price"
    t.index ["kind_id"], name: "index_products_on_kind_id"
  end

  create_table "sale_products", force: :cascade do |t|
    t.integer "status"
    t.integer "quantity"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_sale_products_on_sale_id"
  end

  create_table "sales", force: :cascade do |t|
    t.bigint "client_id"
    t.bigint "user_id"
    t.bigint "discount_id"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_sales_on_client_id"
    t.index ["discount_id"], name: "index_sales_on_discount_id"
    t.index ["user_id"], name: "index_sales_on_user_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "status"
    t.bigint "sale_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sale_id"], name: "index_schedules_on_sale_id"
  end

  create_table "traffic_statuses", force: :cascade do |t|
    t.bigint "traffic_id"
    t.bigint "client_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "sale_id"
    t.index ["client_id"], name: "index_traffic_statuses_on_client_id"
    t.index ["sale_id"], name: "index_traffic_statuses_on_sale_id"
    t.index ["traffic_id"], name: "index_traffic_statuses_on_traffic_id"
    t.index ["user_id"], name: "index_traffic_statuses_on_user_id"
  end

  create_table "traffics", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.integer "status"
    t.integer "kind"
    t.text "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "addresses", "clients"
  add_foreign_key "addresses", "users"
  add_foreign_key "clients", "users"
  add_foreign_key "documents", "clients"
  add_foreign_key "documents", "users"
  add_foreign_key "phones", "clients"
  add_foreign_key "phones", "users"
  add_foreign_key "product_ins", "products"
  add_foreign_key "product_outs", "products"
  add_foreign_key "product_outs", "traffics"
  add_foreign_key "product_quantities", "products"
  add_foreign_key "products", "kinds"
  add_foreign_key "sale_products", "sales"
  add_foreign_key "sales", "clients"
  add_foreign_key "sales", "discounts"
  add_foreign_key "sales", "users"
  add_foreign_key "schedules", "sales"
  add_foreign_key "traffic_statuses", "clients"
  add_foreign_key "traffic_statuses", "sales"
  add_foreign_key "traffic_statuses", "traffics"
  add_foreign_key "traffic_statuses", "users"
end
