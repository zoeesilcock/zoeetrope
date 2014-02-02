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

ActiveRecord::Schema.define(version: 20140202172758) do

  create_table "admins", force: true do |t|
    t.string   "email",            null: false
    t.string   "crypted_password", null: false
    t.string   "salt",             null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true

  create_table "projects", force: true do |t|
    t.string   "title"
    t.text     "intro"
    t.text     "description"
    t.string   "license"
    t.string   "repository"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "download_url"
  end

  create_table "technologies", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "used_technologies", force: true do |t|
    t.integer  "project_id"
    t.integer  "technology_id"
    t.integer  "sort_order",    default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "used_technologies", ["project_id"], name: "index_used_technologies_on_project_id"
  add_index "used_technologies", ["technology_id"], name: "index_used_technologies_on_technology_id"

end
