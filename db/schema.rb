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

ActiveRecord::Schema.define(version: 20160130192211) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cases", force: :cascade do |t|
    t.string   "name"
    t.integer  "questionary_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["questionary_id"], name: "index_cases_on_questionary_id", using: :btree
  end

  create_table "jobs", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participants", force: :cascade do |t|
    t.integer  "age"
    t.integer  "gender"
    t.integer  "web_usage"
    t.string   "token"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "profession_id"
  end

  create_table "professions", force: :cascade do |t|
    t.integer  "job_id"
    t.integer  "participant_id"
    t.string   "additional"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["job_id"], name: "index_professions_on_job_id", using: :btree
    t.index ["participant_id"], name: "index_professions_on_participant_id", using: :btree
  end

  create_table "questionaries", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trackings", force: :cascade do |t|
    t.integer  "case_id"
    t.integer  "participant_id"
    t.integer  "time"
    t.integer  "case_sheet"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["case_id"], name: "index_trackings_on_case_id", using: :btree
    t.index ["participant_id"], name: "index_trackings_on_participant_id", using: :btree
  end

  add_foreign_key "cases", "questionaries"
  add_foreign_key "professions", "jobs"
  add_foreign_key "professions", "participants"
  add_foreign_key "trackings", "cases"
  add_foreign_key "trackings", "participants"
end
