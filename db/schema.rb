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

ActiveRecord::Schema.define(version: 20141115044937) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.date     "dt_creation"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_posters", force: true do |t|
    t.integer  "category_id"
    t.integer  "poster_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_posters", ["category_id"], name: "index_categories_posters_on_category_id", using: :btree
  add_index "categories_posters", ["poster_id"], name: "index_categories_posters_on_poster_id", using: :btree

  create_table "logs", force: true do |t|
    t.string   "type"
    t.text     "description"
    t.date     "date_save"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posters", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.date     "date_event"
    t.string   "ref_imagem"
    t.date     "date_expiration"
    t.boolean  "disabled"
    t.text     "cause_blockage"
    t.string   "theme"
    t.boolean  "visibility_title"
    t.boolean  "visibility_description"
    t.boolean  "visibility_date_event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.integer  "id_facebook"
    t.string   "perfil"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
