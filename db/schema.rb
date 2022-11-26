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

ActiveRecord::Schema[7.0].define(version: 2022_11_26_165035) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "exercises", force: :cascade do |t|
    t.boolean "check"
    t.bigint "phrase_id"
    t.bigint "lesson_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_exercises_on_lesson_id"
    t.index ["phrase_id"], name: "index_exercises_on_phrase_id"
  end

  create_table "expressions", force: :cascade do |t|
    t.bigint "word_id"
    t.bigint "phrase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["phrase_id"], name: "index_expressions_on_phrase_id"
    t.index ["word_id"], name: "index_expressions_on_word_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.boolean "check"
    t.integer "experience"
    t.bigint "list_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_id"], name: "index_lessons_on_list_id"
  end

  create_table "lists", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "check"
    t.bigint "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_lists_on_section_id"
  end

  create_table "phrase_translations", force: :cascade do |t|
    t.bigint "phrase_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "translation"
    t.index ["phrase_id"], name: "index_phrase_translations_on_phrase_id"
  end

  create_table "phrases", force: :cascade do |t|
    t.integer "difficulty"
    t.string "audio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.boolean "check"
    t.bigint "user_id"
    t.bigint "exercise_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exercise_id"], name: "index_reports_on_exercise_id"
    t.index ["user_id"], name: "index_reports_on_user_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "check"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.boolean "admin", default: false
    t.string "name"
    t.integer "experience"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_classes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "word_translations", force: :cascade do |t|
    t.bigint "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "translation"
    t.index ["word_id"], name: "index_word_translations_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string "name"
    t.string "audio"
    t.bigint "word_class_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_class_id"], name: "index_words_on_word_class_id"
  end

  add_foreign_key "exercises", "lessons"
  add_foreign_key "exercises", "phrases"
  add_foreign_key "expressions", "phrases"
  add_foreign_key "expressions", "words"
  add_foreign_key "lessons", "lists"
  add_foreign_key "lists", "sections"
  add_foreign_key "phrase_translations", "phrases"
  add_foreign_key "reports", "exercises"
  add_foreign_key "reports", "users"
  add_foreign_key "word_translations", "words"
  add_foreign_key "words", "word_classes"
end
