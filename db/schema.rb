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

ActiveRecord::Schema.define(version: 2023_11_26_180210) do

  create_table "appointments", force: :cascade do |t|
    t.integer "doktor_id", null: false
    t.datetime "date"
    t.integer "pacjent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["doktor_id"], name: "index_appointments_on_doktor_id"
    t.index ["pacjent_id"], name: "index_appointments_on_pacjent_id"
  end

  create_table "doktors", force: :cascade do |t|
    t.string "imie"
    t.string "nazwisko"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "pacjents", force: :cascade do |t|
    t.string "imie"
    t.string "nazwisko"
    t.date "urodziny"
    t.string "miasto"
    t.string "pesel"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "plec"
  end

  add_foreign_key "appointments", "doktors"
  add_foreign_key "appointments", "pacjents"
end
