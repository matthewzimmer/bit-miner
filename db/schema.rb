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

ActiveRecord::Schema.define(version: 20140518133648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blocks", force: true do |t|
    t.integer  "miner_id",                                        null: false
    t.string   "magic_number",             default: "0xD9B4BEF9", null: false
    t.integer  "version",                                         null: false
    t.string   "hash_curr_block",                                 null: false
    t.string   "hash_prev_block",                                 null: false
    t.float    "rewarded_transaction_fee", default: 0.0
    t.integer  "rewarded_bitcoins",        default: 25
    t.datetime "mined_at"
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "miners", force: true do |t|
    t.string   "email",      null: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "profiles", force: true do |t|
    t.integer  "miner_id"
    t.string   "nickname",                            null: false
    t.text     "public_key",                          null: false
    t.string   "first_name",                          null: false
    t.string   "last_name",                           null: false
    t.string   "bio",                 default: ""
    t.integer  "reputation",          default: 0
    t.boolean  "is_public",           default: false
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "stat_sheets", force: true do |t|
    t.integer  "miner_id",                             null: false
    t.integer  "blocks_mined",           default: 0
    t.float    "time_between_blocks",    default: 0.0
    t.integer  "bitcoins_mined",         default: 0
    t.float    "total_transaction_fees", default: 0.0
    t.integer  "number_of_transactions", default: 0
    t.datetime "deleted_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
