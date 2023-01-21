# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_01_21_123607) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "vat_code"
    t.string "address"
    t.string "city"
    t.string "post_code"
    t.string "country"
    t.string "website"
    t.string "phone"
    t.string "fax"
    t.string "email"
    t.string "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "client_id", null: false
    t.date "creation_date"
    t.date "pay_until"
    t.string "vat_method"
    t.string "discount"
    t.jsonb "extra_stuff"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_invoices_on_client_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.string "unit"
    t.string "amount"
    t.string "price"
    t.string "vat"
    t.bigint "invoice_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_services_on_invoice_id"
  end

  add_foreign_key "invoices", "clients"
  add_foreign_key "services", "invoices"
end
