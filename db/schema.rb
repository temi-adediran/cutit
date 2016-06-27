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

ActiveRecord::Schema.define(version: 20160627143949) do

  create_table "urls", force: :cascade do |t|
    t.string   "long_url"
    t.string   "short_url"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "user_id"
    t.integer  "click_count", default: 0
  end

  add_index "urls", ["short_url"], name: "index_urls_on_short_url", unique: true
  add_index "urls", ["user_id"], name: "index_urls_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.string   "password_digest"
    t.integer  "urls_count",      default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

  create_table "visits", force: :cascade do |t|
    t.string   "browser"
    t.string   "version"
    t.string   "platform"
    t.string   "os"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "url_id"
  end

  add_index "visits", ["url_id"], name: "index_visits_on_url_id"

end
