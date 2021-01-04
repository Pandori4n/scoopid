# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_01_04_154320) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "chatrooms", force: :cascade do |t|
    t.string "name"
    t.bigint "volunteer_id", null: false
    t.bigint "host_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "lost_person_id", null: false
    t.index ["host_id"], name: "index_chatrooms_on_host_id"
    t.index ["lost_person_id"], name: "index_chatrooms_on_lost_person_id"
    t.index ["volunteer_id"], name: "index_chatrooms_on_volunteer_id"
  end

  create_table "feed_infos", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.bigint "user_id", null: false
    t.bigint "lost_person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["lost_person_id"], name: "index_feed_infos_on_lost_person_id"
    t.index ["user_id"], name: "index_feed_infos_on_user_id"
  end

  create_table "lost_people", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.text "last_known_location"
    t.text "last_known_clothes"
    t.integer "height"
    t.string "body_type"
    t.text "description"
    t.datetime "disparition_date_time"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "found", default: false
    t.string "code"
    t.index ["user_id"], name: "index_lost_people_on_user_id"
  end

  create_table "messages", force: :cascade do |t|
    t.string "content"
    t.bigint "chatroom_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["chatroom_id"], name: "index_messages_on_chatroom_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "search_parties", force: :cascade do |t|
    t.string "meeting_location"
    t.text "description"
    t.integer "radius"
    t.bigint "lost_person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "authentication_token"
    t.float "latitude"
    t.float "longitude"
    t.date "date"
    t.time "start_time"
    t.time "end_time"
    t.index ["lost_person_id"], name: "index_search_parties_on_lost_person_id"
  end

  create_table "search_party_attendancies", force: :cascade do |t|
    t.json "itinerary", default: "{}", null: false
    t.datetime "start_date_time"
    t.datetime "end_date_time"
    t.bigint "user_id", null: false
    t.bigint "search_party_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "color"
    t.index ["search_party_id"], name: "index_search_party_attendancies_on_search_party_id"
    t.index ["user_id"], name: "index_search_party_attendancies_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "chatrooms", "lost_people"
  add_foreign_key "chatrooms", "users", column: "host_id"
  add_foreign_key "chatrooms", "users", column: "volunteer_id"
  add_foreign_key "feed_infos", "lost_people"
  add_foreign_key "feed_infos", "users"
  add_foreign_key "lost_people", "users"
  add_foreign_key "messages", "chatrooms"
  add_foreign_key "messages", "users"
  add_foreign_key "search_parties", "lost_people"
  add_foreign_key "search_party_attendancies", "search_parties"
  add_foreign_key "search_party_attendancies", "users"
end
