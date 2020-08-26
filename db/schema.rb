# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_08_24_220608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "complement"
    t.string "neighborhood"
    t.string "state"
    t.string "zip"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "deliverer_addresses", force: :cascade do |t|
    t.bigint "address_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_deliverer_addresses_on_address_id"
    t.index ["user_id"], name: "index_deliverer_addresses_on_user_id"
  end

  create_table "deliverer_orders", force: :cascade do |t|
    t.string "qr_code"
    t.bigint "e_box_id", null: false
    t.bigint "order_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["e_box_id"], name: "index_deliverer_orders_on_e_box_id"
    t.index ["order_id"], name: "index_deliverer_orders_on_order_id"
    t.index ["user_id"], name: "index_deliverer_orders_on_user_id"
  end

  create_table "e_boxes", force: :cascade do |t|
    t.string "e_box_code"
    t.string "compartiment_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price_in_cents"
    t.string "status", default: "placed"
    t.bigint "payment_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["payment_id"], name: "index_orders_on_payment_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "card_number"
    t.string "card_holder"
    t.string "card_expiry_date"
    t.string "card_cvv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "retriever_orders", force: :cascade do |t|
    t.string "qr_code"
    t.bigint "e_box_id", null: false
    t.bigint "order_id", null: false
    t.bigint "retriever_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["e_box_id"], name: "index_retriever_orders_on_e_box_id"
    t.index ["order_id"], name: "index_retriever_orders_on_order_id"
    t.index ["retriever_id"], name: "index_retriever_orders_on_retriever_id"
  end

  create_table "retrievers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "mobile"
    t.string "document"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "mobile"
    t.string "document"
    t.boolean "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "deliverer_addresses", "addresses"
  add_foreign_key "deliverer_addresses", "users"
  add_foreign_key "deliverer_orders", "e_boxes"
  add_foreign_key "deliverer_orders", "orders"
  add_foreign_key "deliverer_orders", "users"
  add_foreign_key "orders", "payments"
  add_foreign_key "retriever_orders", "e_boxes"
  add_foreign_key "retriever_orders", "orders"
  add_foreign_key "retriever_orders", "retrievers"
end
