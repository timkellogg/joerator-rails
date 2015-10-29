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

ActiveRecord::Schema.define(version: 20151029170029) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "coffeeshops", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "webAddress"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.time     "opens_at"
    t.time     "closes_at"
    t.integer  "price"
    t.boolean  "accepts_credit",  default: true
    t.string   "parking"
    t.string   "style"
    t.boolean  "vegan_friendly",  default: false
    t.boolean  "veggie_friendly", default: false
    t.string   "city"
    t.string   "state"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "picture"
    t.float    "overall_average", default: 0.0
    t.float    "average_hipster", default: 0.0
    t.float    "average_study",   default: 0.0
    t.float    "average_laptop",  default: 0.0
    t.float    "average_quality", default: 0.0
    t.boolean  "approved",        default: false
  end

  create_table "coffeeshops_users", force: :cascade do |t|
    t.integer "coffeeshop_id"
    t.integer "user_id"
  end

  create_table "items", force: :cascade do |t|
    t.integer "menu_id"
    t.string  "name"
    t.text    "description"
    t.boolean "veggie_friendly", default: false
    t.boolean "vegan_friendly",  default: false
    t.boolean "gluten_free",     default: false
    t.string  "meal_type"
    t.integer "price"
    t.string  "picture"
  end

  add_index "items", ["menu_id"], name: "index_items_on_menu_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.integer "coffeeshop_id"
  end

  add_index "menus", ["coffeeshop_id"], name: "index_menus_on_coffeeshop_id", using: :btree

  create_table "reviews", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "body"
    t.string   "title"
    t.integer  "qualityRating"
    t.integer  "hipsterRating"
    t.integer  "studyRating"
    t.integer  "laptopRating"
    t.integer  "coffeeshop_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "reviews", ["coffeeshop_id"], name: "index_reviews_on_coffeeshop_id", using: :btree
  add_index "reviews", ["user_id"], name: "index_reviews_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.text     "bio"
    t.string   "favorite_coffee"
    t.string   "location"
    t.string   "facebook_link"
    t.string   "twitter_link"
    t.string   "google_link"
    t.string   "instagram_link"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "items", "menus"
  add_foreign_key "reviews", "coffeeshops"
  add_foreign_key "reviews", "users"
end
