# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100518062237) do

  create_table "contents", :force => true do |t|
    t.string   "name",              :default => ""
    t.integer  "location_id"
    t.string   "tags",              :default => ""
    t.string   "item_file_name"
    t.string   "item_content_type"
    t.integer  "item_file_size"
    t.datetime "item_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "added",             :default => 0
    t.integer  "deleted",           :default => 0
    t.integer  "order",             :default => 0
  end

  create_table "locations", :force => true do |t|
    t.string   "name"
    t.string   "coordinates"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "package_id"
    t.integer  "added",       :default => 0
    t.integer  "deleted",     :default => 0
    t.string   "tags",        :default => ""
  end

  create_table "packages", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "version",    :default => 0
  end

end
