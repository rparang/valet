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

ActiveRecord::Schema.define(:version => 20140422001713) do

  create_table "attachments", :force => true do |t|
    t.string   "name"
    t.integer  "feature_id"
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "features", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
    t.string   "code"
    t.string   "launch_date_string"
    t.datetime "launch_date"
  end

  create_table "links", :force => true do |t|
    t.string   "name"
    t.integer  "feature_id"
    t.string   "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer  "user_id"
    t.integer  "feature_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "email_display_name"
    t.string   "email_formatted"
    t.text     "bio"
    t.boolean  "subscribed_to_email", :default => true
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
  end

end
