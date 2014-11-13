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

ActiveRecord::Schema.define(version: 20141113184721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "insta", force: true do |t|
    t.integer  "insta_id"
    t.integer  "user_id"
    t.integer  "trip_id"
    t.string   "insta_url"
    t.string   "thumbnail_url"
    t.string   "full_size_url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "insta", ["trip_id"], name: "index_insta_on_trip_id", using: :btree
  add_index "insta", ["user_id"], name: "index_insta_on_user_id", using: :btree

  create_table "resorts", force: true do |t|
    t.string   "name"
    t.float    "lat"
    t.float    "lng"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trips", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "date"
    t.integer  "resort_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "coverphoto"
    t.integer  "owner_id"
  end

  add_index "trips", ["resort_id"], name: "index_trips_on_resort_id", using: :btree

  create_table "trips_users", id: false, force: true do |t|
    t.integer "trip_id"
    t.integer "user_id"
  end

  add_index "trips_users", ["trip_id"], name: "index_trips_users_on_trip_id", using: :btree
  add_index "trips_users", ["user_id"], name: "index_trips_users_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "instagram_username"
    t.integer  "instagram_id"
    t.string   "twitter_username"
    t.string   "epic_mix_username"
    t.string   "epic_mix_password"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar"
    t.string   "image"
  end

  add_index "users", ["instagram_id"], name: "index_users_on_instagram_id", using: :btree
  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
