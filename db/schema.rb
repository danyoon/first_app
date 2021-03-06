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

ActiveRecord::Schema.define(:version => 20131116070818) do

  create_table "authentications", :force => true do |t|
    t.integer   "user_id"
    t.string    "provider"
    t.string    "uid"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "connections", :force => true do |t|
    t.integer   "connecter_id"
    t.integer   "connected_id"
    t.timestamp "created_at",   :null => false
    t.timestamp "updated_at",   :null => false
  end

  add_index "connections", ["connected_id"], :name => "index_connections_on_connected_id"
  add_index "connections", ["connecter_id", "connected_id"], :name => "index_connections_on_connecter_id_and_connected_id", :unique => true
  add_index "connections", ["connecter_id"], :name => "index_connections_on_connecter_id"

  create_table "hotel_permlinks", :force => true do |t|
    t.string   "key"
    t.integer  "sender_id"
    t.integer  "hotel_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hotel_permlinks", ["key", "sender_id", "hotel_id"], :name => "index_hotel_permlinks_on_key_and_sender_id_and_hotel_id"

  create_table "hotel_photos", :force => true do |t|
    t.integer  "hotel_id"
    t.integer  "user_id"
    t.string   "image"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "hotel_photos", ["hotel_id"], :name => "index_hotel_photos_on_hotel_id"
  add_index "hotel_photos", ["user_id"], :name => "index_hotel_photos_on_user_id"

  create_table "hotels", :force => true do |t|
    t.string    "name"
    t.string    "address"
    t.string    "city"
    t.string    "country"
    t.integer   "zipcode"
    t.timestamp "created_at",                     :null => false
    t.timestamp "updated_at",                     :null => false
    t.string    "mainstreet"
    t.string    "crossstreet"
    t.string    "key"
    t.string    "owner"
    t.string    "image"
    t.string    "hotelID"
    t.integer   "permlinks_count", :default => 0
  end

  create_table "microposts", :force => true do |t|
    t.string    "content"
    t.integer   "user_id"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "prices", :force => true do |t|
    t.decimal   "rate"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
    t.integer   "hotel_id"
    t.date      "date_for"
  end

  create_table "relationships", :force => true do |t|
    t.integer   "follower_id"
    t.integer   "followed_id"
    t.timestamp "created_at",  :null => false
    t.timestamp "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string    "name"
    t.string    "email"
    t.timestamp "created_at",                             :null => false
    t.timestamp "updated_at",                             :null => false
    t.string    "password_digest"
    t.string    "remember_token"
    t.boolean   "admin"
    t.string    "password_reset_token"
    t.timestamp "password_reset_sent_at"
    t.string    "encrypted_password",     :default => "", :null => false
    t.string    "reset_password_token"
    t.timestamp "reset_password_sent_at"
    t.timestamp "remember_created_at"
    t.integer   "sign_in_count",          :default => 0
    t.timestamp "current_sign_in_at"
    t.timestamp "last_sign_in_at"
    t.string    "current_sign_in_ip"
    t.string    "last_sign_in_ip"
    t.integer   "connections_count",      :default => 0
    t.integer   "hotel_permlinks_count",  :default => 0
  end

  add_index "users", ["connections_count"], :name => "index_users_on_connections_count"
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
