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

ActiveRecord::Schema.define(version: 20150405191104) do

  create_table "appointments", force: :cascade do |t|
    t.string   "content",    limit: 255
    t.string   "file",       limit: 255
    t.string   "type",       limit: 255
    t.integer  "user_id",    limit: 4
    t.integer  "client_id",  limit: 4
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "appointments", ["client_id"], name: "index_appointments_on_client_id", using: :btree
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id", using: :btree

  create_table "complaints", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "client_id",  limit: 4
    t.string   "content",    limit: 255
    t.string   "file",       limit: 255
    t.string   "type",       limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "complaints", ["client_id"], name: "index_complaints_on_client_id", using: :btree
  add_index "complaints", ["user_id"], name: "index_complaints_on_user_id", using: :btree

  create_table "guardian_patients", force: :cascade do |t|
    t.integer "patient_id",  limit: 4
    t.integer "guardian_id", limit: 4
  end

  create_table "guardians", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "tel",        limit: 255
    t.text     "remark",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "patient_records", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.string   "type",       limit: 255
    t.string   "content",    limit: 255
    t.string   "file",       limit: 255
    t.string   "contact",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "patient_records", ["patient_id"], name: "index_patient_records_on_patient_id", using: :btree

  create_table "patient_services", force: :cascade do |t|
    t.integer  "patient_id", limit: 4
    t.string   "type",       limit: 255
    t.string   "contact",    limit: 255
    t.string   "content",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "patient_services", ["patient_id"], name: "index_patient_services_on_patient_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "sex",        limit: 255
    t.string   "tel",        limit: 255
    t.string   "address",    limit: 255
    t.text     "remark",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "terminal_records", force: :cascade do |t|
    t.integer  "terminal_id", limit: 4
    t.integer  "patient_id",  limit: 4
    t.string   "pulse_rate",  limit: 255
    t.string   "position",    limit: 255
    t.string   "temperature", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "terminal_records", ["patient_id"], name: "index_terminal_records_on_patient_id", using: :btree
  add_index "terminal_records", ["terminal_id"], name: "index_terminal_records_on_terminal_id", using: :btree

  create_table "terminals", force: :cascade do |t|
    t.string   "sn",         limit: 255
    t.integer  "patient_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "login",      limit: 255
    t.string   "password",   limit: 255
    t.string   "name",       limit: 255
    t.integer  "role_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

end
