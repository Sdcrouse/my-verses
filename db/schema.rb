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

ActiveRecord::Schema.define(version: 2020_12_27_052336) do

  create_table "my_verses", force: :cascade do |t|
    t.string "version"
    t.text "verse_text"
    t.text "reason_liked"
    t.integer "user_id"
    t.integer "verse_reference_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "category"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "first_name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "verse_references", force: :cascade do |t|
    t.string "book"
    t.string "chapter"
    t.string "verse_start"
    t.string "verse_end"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
