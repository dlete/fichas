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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120121212754) do

  create_table "departments", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "departments_managers", :force => true do |t|
    t.integer  "department_id"
    t.integer  "user_id"
    t.boolean  "deputy"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments_managers", ["department_id"], :name => "index_departments_managers_on_department_id"
  add_index "departments_managers", ["user_id"], :name => "index_departments_managers_on_user_id"

  create_table "departments_members", :force => true do |t|
    t.integer  "department_id"
    t.integer  "user_id"
    t.boolean  "administrative_department", :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "departments_members", ["department_id"], :name => "index_departments_members_on_department_id"
  add_index "departments_members", ["user_id"], :name => "index_departments_members_on_user_id"

  create_table "public_holidays", :force => true do |t|
    t.date     "day"
    t.string   "event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "submissions", :force => true do |t|
    t.integer  "submitter_id"
    t.integer  "approver_id"
    t.date     "period_end"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workdays", :force => true do |t|
    t.date     "working_date"
    t.decimal  "working_hours"
    t.integer  "user_id"
    t.integer  "submission_id_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
