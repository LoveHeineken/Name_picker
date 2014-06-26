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

ActiveRecord::Schema.define(version: 20130816124133) do

  create_table "companies", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "fax"
    t.string   "tel"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "hoges", force: true do |t|
    t.integer  "suuji"
    t.string   "mojiretsu"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "name_cards", force: true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "fax"
    t.string   "tel"
    t.string   "url"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "mail"
    t.string   "tel"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
