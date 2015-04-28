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

ActiveRecord::Schema.define(:version => 20130425184149) do

  create_table "analytics", :force => true do |t|
    t.string   "report"
    t.string   "report_type"
    t.integer  "user_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "domains", :force => true do |t|
    t.integer  "shelf_id"
    t.integer  "user_id"
    t.string   "body"
    t.string   "tld"
    t.string   "full_body"
    t.string   "domain_type"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "domains", ["shelf_id"], :name => "index_domains_on_shelf_id"
  add_index "domains", ["user_id"], :name => "index_domains_on_user_id"

  create_table "endings", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.integer  "price",      :default => 0
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
    t.string   "language"
  end

  create_table "payment_notifications", :force => true do |t|
    t.text     "params"
    t.integer  "user_id"
    t.string   "status"
    t.string   "transaction_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "registrar_tlds", :force => true do |t|
    t.string   "tld"
    t.integer  "price"
    t.integer  "registrar_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "registrars", :force => true do |t|
    t.string   "name"
    t.string   "extra"
    t.text     "url_param"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "related_words", :force => true do |t|
    t.string   "word"
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "related_words", ["word"], :name => "index_related_words_on_word"

  create_table "shelf_accesses", :force => true do |t|
    t.integer  "shelf_id"
    t.string   "email"
    t.string   "access"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shelf_accesses", ["email"], :name => "index_shelf_accesses_on_user_id"
  add_index "shelf_accesses", ["shelf_id"], :name => "index_shelf_accesses_on_shelf_id"

  create_table "shelves", :force => true do |t|
    t.string   "label"
    t.integer  "user_id"
    t.string   "shelf_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "shelves", ["user_id"], :name => "index_shelves_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "username"
    t.string   "membership_type"
    t.boolean  "super"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "watch_domains", :force => true do |t|
    t.string   "full_body"
    t.date     "expire_date"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "watch_domains", ["expire_date"], :name => "index_watch_domains_on_expire_date"
  add_index "watch_domains", ["full_body"], :name => "index_watch_domains_on_full_body"

end
