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

ActiveRecord::Schema.define(version: 2021_04_09_021845) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "street"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "gig_instruments", force: :cascade do |t|
    t.bigint "gigs_id"
    t.bigint "instruments_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "gig_instrument_status"
    t.integer "musician_id"
    t.index ["gigs_id"], name: "index_gig_instruments_on_gigs_id"
    t.index ["instruments_id"], name: "index_gig_instruments_on_instruments_id"
  end

  create_table "gigs", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "start_time"
    t.string "duration"
    t.string "genre"
    t.string "date"
    t.string "address"
    t.string "phone"
    t.string "salary"
    t.integer "instrument_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "musician_id"
    t.integer "gig_status"
    t.integer "planner_id"
  end

  create_table "instruments", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_instruments", force: :cascade do |t|
    t.bigint "users_id"
    t.bigint "instruments_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["instruments_id"], name: "index_user_instruments_on_instruments_id"
    t.index ["users_id"], name: "index_user_instruments_on_users_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.bigint "instrument_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role"
    t.index ["instrument_id"], name: "index_users_on_instrument_id"
  end

  add_foreign_key "users", "instruments"
end
