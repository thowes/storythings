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

ActiveRecord::Schema.define(version: 20150209175344) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "badges", force: true do |t|
    t.string   "name"
    t.string   "picture"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "experiences", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "user_id"
    t.integer  "quest_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "experiences", ["user_id", "created_at"], name: "index_experiences_on_user_id_and_created_at", using: :btree

  create_table "items", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "is_a_box",   default: false
    t.string   "ancestry"
  end

  add_index "items", ["ancestry"], name: "index_items_on_ancestry", using: :btree
  add_index "items", ["is_a_box"], name: "index_items_on_is_a_box", using: :btree
  add_index "items", ["user_id", "created_at"], name: "index_items_on_user_id_and_created_at", using: :btree

  create_table "licenses", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at", using: :btree

  create_table "quests", force: true do |t|
    t.string   "name"
    t.string   "qtype",      default: "QA"
    t.integer  "mother",     default: 0
    t.integer  "next_quest", default: 0
    t.integer  "prev_quest", default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "ancestry"
  end

  add_index "quests", ["ancestry"], name: "index_quests_on_ancestry", using: :btree

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id", using: :btree
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true, using: :btree
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.integer  "max_items",       default: 10
    t.string   "player_type",     default: "Nomad"
    t.integer  "player_level",    default: 0
    t.integer  "privacy",         default: 0
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
