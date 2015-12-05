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

ActiveRecord::Schema.define(version: 20151205065958) do

  create_table "clients", force: :cascade do |t|
    t.string   "code",       limit: 10
    t.string   "name"
    t.string   "org_code"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "timezone"
    t.string   "locale"
  end

  create_table "communications", force: :cascade do |t|
    t.string   "org_code",        limit: 20
    t.string   "client_code",     limit: 20
    t.string   "primary_email"
    t.string   "secondary_email"
    t.string   "primary_phone"
    t.string   "secondary_phone"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "events", force: :cascade do |t|
    t.string   "praxis_code"
    t.string   "event_id"
    t.datetime "occurred_at"
    t.string   "zipcode"
    t.string   "country"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "indices", force: :cascade do |t|
    t.string   "job_code"
    t.string   "realm_code"
    t.string   "cron"
    t.boolean  "critical"
    t.string   "notify"
    t.string   "jobkey"
    t.integer  "run_length"
    t.string   "success_step"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "org_code"
    t.string   "job_code"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "client_code"
  end

  create_table "labels", force: :cascade do |t|
    t.string   "org_code"
    t.string   "client_code"
    t.string   "key"
    t.string   "label_name"
    t.string   "realm_code"
    t.string   "icon"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "milestones", force: :cascade do |t|
    t.string   "org_code"
    t.string   "client_code"
    t.string   "key"
    t.string   "realm_code"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "orgs", force: :cascade do |t|
    t.string   "code",       limit: 10
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "timezone"
    t.string   "locale"
  end

  create_table "praxis", force: :cascade do |t|
    t.string   "praxis_code"
    t.string   "org_code"
    t.string   "client_code"
    t.string   "milestone_key"
    t.string   "realm_code"
    t.string   "prosess_code"
    t.string   "stage_code"
    t.integer  "sequence"
    t.integer  "sla"
    t.integer  "tolerance_percentage"
    t.boolean  "critical"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "prosesses", force: :cascade do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "realms", force: :cascade do |t|
    t.string   "code",       limit: 10
    t.string   "name"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "activities", default: "{}"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "runs", force: :cascade do |t|
    t.string   "jobkey"
    t.string   "runkey"
    t.string   "stage"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "stages", force: :cascade do |t|
    t.string   "code",       limit: 20
    t.string   "name"
    t.boolean  "critical"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "salt"
    t.string   "remember"
    t.integer  "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "widgets", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "stock"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
