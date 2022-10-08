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

ActiveRecord::Schema[7.0].define(version: 2022_10_08_025254) do
  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "memo_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "createdAt"
    t.string "updatedAt"
    t.boolean "deleted"
    t.string "deletedAt"
    t.index ["memo_id"], name: "index_comments_on_memo_id"
  end

  create_table "memos", force: :cascade do |t|
    t.text "body"
    t.boolean "completed"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "deleted"
    t.string "createdAt"
    t.string "updatedAt"
    t.string "completedAt"
    t.string "deletedAt"
    t.index ["user_id"], name: "index_memos_on_user_id"
  end

  create_table "settings", force: :cascade do |t|
    t.boolean "hide_completed_memo"
    t.boolean "display_comment_date"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "dark_mode", default: "os"
    t.index ["user_id"], name: "index_settings_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "comments", "memos"
  add_foreign_key "memos", "users"
  add_foreign_key "settings", "users"
end
