# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150504000356) do

  create_table "inventorymaster_areas", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventorymaster_locations", force: :cascade do |t|
    t.string   "name"
    t.string   "street_adress"
    t.string   "city"
    t.string   "state"
    t.string   "zip_code"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "inventorymaster_manufacturers", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventorymaster_products", force: :cascade do |t|
    t.string   "name"
    t.string   "sku"
    t.string   "upc"
    t.text     "summary"
    t.string   "labels"
    t.integer  "area_id"
    t.integer  "manufacturer_id"
    t.integer  "minimum_stock_count"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "ammount"
    t.integer  "location_id"
  end

  create_table "inventorymaster_settings", force: :cascade do |t|
    t.boolean  "stok_alerts"
    t.integer  "minimum_stock_count"
    t.string   "currency"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "inventorymaster_transaction_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "inventorymaster_transactions", force: :cascade do |t|
    t.string   "kind"
    t.date     "date"
    t.integer  "location_id"
    t.integer  "user_id"
    t.string   "upc"
    t.float    "unit_cost"
    t.float    "unit_sale"
    t.integer  "ammount"
    t.float    "average_cost"
    t.string   "reason"
    t.string   "comment"
    t.string   "serial_number"
    t.integer  "transaction_type_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "product_id"
  end

end
