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

ActiveRecord::Schema.define(:version => 20130304212536) do

  create_table "agencies", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "url",        :null => false
    t.string   "timezone",   :null => false
    t.string   "lang"
    t.string   "phone"
    t.string   "fare_url"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "calendar_services", :force => true do |t|
    t.integer  "agency_id",  :null => false
    t.string   "code",       :null => false
    t.boolean  "monday",     :null => false
    t.boolean  "tuesday",    :null => false
    t.boolean  "wednesday",  :null => false
    t.boolean  "thursday",   :null => false
    t.boolean  "friday",     :null => false
    t.boolean  "saturday",   :null => false
    t.boolean  "sunday",     :null => false
    t.date     "starts_on",  :null => false
    t.date     "ends_on",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "routes", :force => true do |t|
    t.integer  "agency_id",  :null => false
    t.string   "short_name", :null => false
    t.string   "long_name",  :null => false
    t.text     "desc"
    t.integer  "route_type", :null => false
    t.string   "url"
    t.string   "color"
    t.string   "text_color"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stops", :force => true do |t|
    t.integer  "agency_stop_id",      :null => false
    t.integer  "agency_id",           :null => false
    t.string   "code"
    t.string   "name",                :null => false
    t.text     "desc"
    t.float    "lat",                 :null => false
    t.float    "lon",                 :null => false
    t.integer  "zone_id"
    t.string   "url"
    t.integer  "location_type"
    t.integer  "parent_station"
    t.string   "timezone"
    t.integer  "wheelchair_boarding"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

end
