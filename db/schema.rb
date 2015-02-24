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

ActiveRecord::Schema.define(version: 20141020083214) do

  create_table "carousels", force: true do |t|
    t.integer  "item_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show",                 default: false
  end

  add_index "carousels", ["item_id"], name: "index_carousels_on_item_id"

  create_table "carts", force: true do |t|
    t.integer  "user_id"
    t.integer  "item_type_id"
    t.integer  "quantity",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "carts", ["item_type_id"], name: "index_carts_on_item_type_id"
  add_index "carts", ["user_id"], name: "index_carts_on_user_id"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["name"], name: "index_categories_on_name"

# Could not dump table "categories_items" because of following NoMethodError
#   undefined method `[]' for nil:NilClass

  create_table "contactnumbers", force: true do |t|
    t.integer  "user_id"
    t.string   "contactnumber"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "contactnumbers", ["user_id"], name: "index_contactnumbers_on_user_id"

  create_table "emails", force: true do |t|
    t.integer  "user_id"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "emails", ["user_id"], name: "index_emails_on_user_id"

  create_table "item_types", force: true do |t|
    t.integer  "item_id"
    t.decimal  "amount"
    t.string   "unit"
    t.integer  "quantity"
    t.decimal  "price"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.integer  "sold",                 default: 0
    t.integer  "reserved",             default: 0
  end

  create_table "items", force: true do |t|
    t.string   "item_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "residences", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "residences", ["name"], name: "index_residences_on_name", unique: true

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "settings", force: true do |t|
    t.string   "var",         null: false
    t.text     "value"
    t.integer  "target_id",   null: false
    t.string   "target_type", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "settings", ["target_type", "target_id", "var"], name: "index_settings_on_target_type_and_target_id_and_var", unique: true

  create_table "taggings", force: true do |t|
    t.integer  "tag_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "taggings", ["item_id"], name: "index_taggings_on_item_id"
  add_index "taggings", ["tag_id"], name: "index_taggings_on_tag_id"

  create_table "tags", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "studentnumber"
    t.integer  "residence_id"
    t.datetime "toc"
    t.integer  "signin_count",        default: 0, null: false
    t.datetime "signed_in_at"
    t.datetime "last_signed_in_at"
    t.string   "signed_in_from"
    t.string   "last_signed_in_from"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "auth"
  end

  add_index "users", ["studentnumber"], name: "index_users_on_studentnumber", unique: true

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
