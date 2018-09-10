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

ActiveRecord::Schema.define(version: 2018_09_10_212824) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title"
    t.string "start_address"
    t.string "end_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "possible_routes", force: :cascade do |t|
    t.bigint "favorite_id"
    t.string "departure_time"
    t.string "arrival_time"
    t.string "duration"
    t.string "distance"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["favorite_id"], name: "index_possible_routes_on_favorite_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "possible_route_id"
    t.string "headsign"
    t.string "arrival_time"
    t.string "departure_time"
    t.string "arrival_stop"
    t.string "departure_stop"
    t.string "name"
    t.string "short_name"
    t.string "instructions"
    t.string "distance"
    t.string "duration"
    t.string "color"
    t.integer "num_stops"
    t.index ["possible_route_id"], name: "index_steps_on_possible_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_foreign_key "favorites", "users"
  add_foreign_key "possible_routes", "favorites"
  add_foreign_key "steps", "possible_routes"
end
