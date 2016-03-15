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

ActiveRecord::Schema.define(version: 20160315143512) do

  create_table "collections", force: :cascade do |t|
    t.string   "name"
    t.integer  "user_id"
    t.string   "description"
    t.boolean  "private?"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "tweets", force: :cascade do |t|
    t.string   "user_name"
    t.string   "user_handle"
    t.integer  "collection_id"
    t.string   "text"
    t.datetime "date"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "twitter_profile"
    t.string   "email_add"
    t.string   "password"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end