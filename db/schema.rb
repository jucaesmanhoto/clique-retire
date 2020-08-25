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

ActiveRecord::Schema.define(version: 2020_08_25_023832) do

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
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["address_id"], name: "index_deliverer_addresses_on_address_id"
    t.index ["users_id"], name: "index_deliverer_addresses_on_users_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.string "qr_code"
    t.bigint "e_boxes_id", null: false
    t.bigint "orders_id", null: false
    t.bigint "users_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["e_boxes_id"], name: "index_deliveries_on_e_boxes_id"
    t.index ["orders_id"], name: "index_deliveries_on_orders_id"
    t.index ["users_id"], name: "index_deliveries_on_users_id"
  end

  create_table "e_boxes", force: :cascade do |t|
    t.string "e_box_code"
    t.string "compartment_size"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.integer "price_in_cents"
    t.string "status"
    t.bigint "payments_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "delivery_id", null: false
    t.bigint "retrieval_id", null: false
    t.index ["delivery_id"], name: "index_orders_on_delivery_id"
    t.index ["payments_id"], name: "index_orders_on_payments_id"
    t.index ["retrieval_id"], name: "index_orders_on_retrieval_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "card_number"
    t.string "card_holder"
    t.string "card_expiry_date"
    t.string "card_cvv"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "retrievals", force: :cascade do |t|
    t.string "qr_code"
    t.bigint "e_boxes_id", null: false
    t.bigint "orders_id", null: false
    t.bigint "retrievers_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["e_boxes_id"], name: "index_retrievals_on_e_boxes_id"
    t.index ["orders_id"], name: "index_retrievals_on_orders_id"
    t.index ["retrievers_id"], name: "index_retrievals_on_retrievers_id"
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
  add_foreign_key "deliverer_addresses", "users", column: "users_id"
  add_foreign_key "deliveries", "e_boxes", column: "e_boxes_id"
  add_foreign_key "deliveries", "orders", column: "orders_id"
  add_foreign_key "deliveries", "users", column: "users_id"
  add_foreign_key "orders", "deliveries"
  add_foreign_key "orders", "payments", column: "payments_id"
  add_foreign_key "orders", "retrievals"
  add_foreign_key "retrievals", "e_boxes", column: "e_boxes_id"
  add_foreign_key "retrievals", "orders", column: "orders_id"
  add_foreign_key "retrievals", "retrievers", column: "retrievers_id"
end
