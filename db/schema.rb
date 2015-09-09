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

ActiveRecord::Schema.define(version: 20150909220914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "announcements", force: :cascade do |t|
    t.string   "name",                        null: false
    t.text     "message",                     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "klasses"
    t.boolean  "all_classes", default: true
    t.date     "expires_on"
    t.boolean  "email_sent",  default: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string   "calendar_file_file_name"
    t.string   "calendar_file_content_type"
    t.integer  "calendar_file_file_size"
    t.datetime "calendar_file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "class_announcements", force: :cascade do |t|
    t.integer  "group_id"
    t.integer  "announcement_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "class_announcements", ["announcement_id"], name: "index_class_announcements_on_announcement_id", using: :btree
  add_index "class_announcements", ["group_id"], name: "index_class_announcements_on_group_id", using: :btree

  create_table "class_contact_lists", force: :cascade do |t|
    t.integer  "group_id"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "class_contact_lists", ["group_id"], name: "index_class_contact_lists_on_group_id", using: :btree

  create_table "class_parents", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "enrolled_students", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "group_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.string   "days"
    t.time     "start_time"
    t.time     "end_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "handbooks", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "newsletters", force: :cascade do |t|
    t.datetime "date"
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.boolean  "email_sent",        default: false
  end

  create_table "peek_and_vocabs", force: :cascade do |t|
    t.date     "date"
    t.string   "peek_file_name"
    t.string   "peek_content_type"
    t.integer  "peek_file_size"
    t.datetime "peek_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "email_sent",         default: false
    t.string   "vocab_file_name"
    t.string   "vocab_content_type"
    t.integer  "vocab_file_size"
    t.datetime "vocab_updated_at"
  end

  create_table "registration_forms", force: :cascade do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "year"
  end

  create_table "students", force: :cascade do |t|
    t.string   "fname",                             null: false
    t.string   "lname",              default: ""
    t.boolean  "currently_enrolled", default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "students_users", id: false, force: :cascade do |t|
    t.integer "student_id"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "fname",                  default: "",       null: false
    t.string   "lname",                  default: "",       null: false
    t.string   "role",                   default: "parent", null: false
    t.boolean  "active",                 default: true
    t.string   "email",                  default: "",       null: false
    t.string   "encrypted_password",     default: "",       null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
