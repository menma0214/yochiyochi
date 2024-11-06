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

ActiveRecord::Schema[7.1].define(version: 2024_10_28_133716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "authentications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "provider", null: false
    t.string "uid", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["provider", "uid"], name: "index_authentications_on_provider_and_uid"
  end

  create_table "bookmarks", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "facility_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.string "bookmarkable_type"
    t.bigint "bookmarkable_id"
    t.index ["bookmarkable_type", "bookmarkable_id"], name: "index_bookmarks_on_bookmarkable"
    t.index ["event_id"], name: "index_bookmarks_on_event_id"
    t.index ["facility_id"], name: "index_bookmarks_on_facility_id"
    t.index ["user_id"], name: "index_bookmarks_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.bigint "user_id", null: false
    t.bigint "review_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["review_id"], name: "index_comments_on_review_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.string "title"
    t.string "name"
    t.string "furigana"
    t.string "address"
    t.string "business_hours"
    t.text "fee"
    t.string "target_age"
    t.string "environment"
    t.text "request"
    t.string "contact"
    t.string "image"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "min_age"
    t.integer "max_age"
    t.string "secondary_image"
    t.string "tertiary_image"
    t.text "event_url"
    t.integer "adult_fee"
    t.integer "child_fee"
    t.index ["facility_id"], name: "index_events_on_facility_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string "title"
    t.string "name"
    t.string "furigana"
    t.string "address"
    t.string "business_hours"
    t.text "fee"
    t.string "target_age"
    t.string "environment"
    t.text "request"
    t.string "contact"
    t.text "facility_url"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "video"
    t.integer "min_age"
    t.integer "max_age"
    t.string "secondary_image"
    t.string "tertiary_image"
    t.integer "adult_fee"
    t.integer "child_fee"
  end

  create_table "places", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.string "address"
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["facility_id"], name: "index_places_on_facility_id"
  end

  create_table "playground_equipments", force: :cascade do |t|
    t.bigint "facility_id", null: false
    t.string "title"
    t.string "kind"
    t.string "target_age"
    t.string "installation"
    t.text "remarks"
    t.string "image"
    t.string "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "secondary_image"
    t.string "tertiary_image"
    t.integer "min_age"
    t.integer "max_age"
    t.index ["facility_id"], name: "index_playground_equipments_on_facility_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "title"
    t.text "body"
    t.float "rate"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reviewable_type", null: false
    t.bigint "reviewable_id", null: false
    t.index ["reviewable_type", "reviewable_id"], name: "index_reviews_on_reviewable"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "taggings", force: :cascade do |t|
    t.bigint "tag_id", null: false
    t.string "taggable_type", null: false
    t.bigint "taggable_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_type", "taggable_id"], name: "index_taggings_on_taggable"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fee_tag", default: "default_value", null: false
    t.string "region_tag", default: "default_value", null: false
    t.string "prefecture_tag", default: "default_value", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "crypted_password"
    t.integer "child_age"
    t.string "child_sex"
    t.string "child_personality"
    t.string "child_trend"
    t.string "like"
    t.integer "role", default: 0, null: false
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.integer "access_count_to_reset_password_page", default: 0
    t.datetime "deleted_at"
    t.string "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.index ["deleted_at"], name: "index_users_on_deleted_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token"
  end

  add_foreign_key "bookmarks", "events"
  add_foreign_key "bookmarks", "facilities"
  add_foreign_key "bookmarks", "users"
  add_foreign_key "comments", "reviews"
  add_foreign_key "comments", "users"
  add_foreign_key "events", "facilities"
  add_foreign_key "places", "facilities"
  add_foreign_key "playground_equipments", "facilities"
  add_foreign_key "reviews", "users"
  add_foreign_key "taggings", "tags"
end
