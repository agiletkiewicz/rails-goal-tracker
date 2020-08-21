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

ActiveRecord::Schema.define(version: 2020_08_21_164244) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.text "key_result"
    t.datetime "completed_date"
    t.boolean "complete"
    t.datetime "by_when"
    t.integer "category_id"
  end

  create_table "notes", force: :cascade do |t|
    t.integer "goal_id"
    t.text "content"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "description"
    t.boolean "complete"
    t.datetime "by_when"
    t.integer "goal_id"
    t.datetime "completed_date"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "password_digest"
    t.string "uid"
  end

end
