# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_06_03_055246) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookstores", force: :cascade do |t|
    t.string "name", null: false
    t.string "address", null: false
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_bookstores_on_user_id"
  end

  create_table "store_reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "bookstore_id", null: false
    t.date "date_entered", null: false
    t.string "opportunity", null: false
    t.string "first_visit", null: false
    t.string "favorite_reason", null: false
    t.string "free_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookstore_id"], name: "index_store_reviews_on_bookstore_id"
    t.index ["user_id"], name: "index_store_reviews_on_user_id"
  end

  create_table "tag_relations", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.bigint "bookstore_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bookstore_id"], name: "index_tag_relations_on_bookstore_id"
    t.index ["tag_id", "bookstore_id"], name: "index_tag_relations_on_tag_id_and_bookstore_id", unique: true
    t.index ["tag_id"], name: "index_tag_relations_on_tag_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "uuid"
    t.text "profile", default: "こんにちは"
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "bookstores", "users"
  add_foreign_key "store_reviews", "bookstores"
  add_foreign_key "store_reviews", "users"
  add_foreign_key "tag_relations", "bookstores"
  add_foreign_key "tag_relations", "tags"
end
