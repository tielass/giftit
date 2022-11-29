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

ActiveRecord::Schema[7.0].define(version: 2022_11_28_150955) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.string "name"
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "hobbies"
    t.float "price"
    t.bigint "user_id", null: false
    t.string "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "gifts", force: :cascade do |t|
    t.string "name"
    t.float "price"
    t.string "photo"
    t.text "description"
    t.string "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_members_on_event_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "photo"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votings", force: :cascade do |t|
    t.bigint "wishlistgift_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_votings_on_user_id"
    t.index ["wishlistgift_id"], name: "index_votings_on_wishlistgift_id"
  end

  create_table "wishlistgifts", force: :cascade do |t|
    t.bigint "gift_id", null: false
    t.bigint "wishlist_id", null: false
    t.boolean "chosen"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gift_id"], name: "index_wishlistgifts_on_gift_id"
    t.index ["wishlist_id"], name: "index_wishlistgifts_on_wishlist_id"
  end

  create_table "wishlists", force: :cascade do |t|
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_wishlists_on_event_id"
  end

  add_foreign_key "events", "users"
  add_foreign_key "members", "events"
  add_foreign_key "members", "users"
  add_foreign_key "votings", "users"
  add_foreign_key "votings", "wishlistgifts"
  add_foreign_key "wishlistgifts", "gifts"
  add_foreign_key "wishlistgifts", "wishlists"
  add_foreign_key "wishlists", "events"
end
