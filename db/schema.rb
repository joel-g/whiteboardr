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

ActiveRecord::Schema.define(version: 20170727232409) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "challenges", force: :cascade do |t|
    t.string   "title",      null: false
    t.string   "input"
    t.string   "output"
    t.string   "body",       null: false
    t.string   "solution"
    t.integer  "difficulty"
    t.integer  "user_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "feedbacks", force: :cascade do |t|
    t.integer  "user_id",          null: false
    t.integer  "interview_id",     null: false
    t.integer  "board_rating",     null: false
    t.integer  "presence_rating",  null: false
    t.integer  "knowledge_rating", null: false
    t.integer  "riot_rating",      null: false
    t.string   "comments",         null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "interviews", force: :cascade do |t|
    t.integer  "interviewer_id",   null: false
    t.integer  "applicant_id",     null: false
    t.integer  "challenge_id",     null: false
    t.integer  "run_time_minutes"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
<<<<<<< HEAD
    t.string   "username",        null: false
    t.string   "email",           null: false
    t.string   "name",            null: false
    t.string   "hashed_password", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
=======
    t.string   "email",            null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.string   "username",         null: false
    t.string   "first_name",       null: false
    t.string   "last_name",        null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
>>>>>>> master
  end

end
