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

ActiveRecord::Schema.define(version: 2020_06_23_161143) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.integer "questionid"
    t.integer "userid"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "topic_id", null: false
    t.integer "scoreanswer"
    t.string "answeruser"
    t.integer "numberanswer"
    t.index ["topic_id"], name: "index_answers_on_topic_id"
  end

  create_table "consents", force: :cascade do |t|
    t.integer "userid"
    t.integer "creatorid"
    t.datetime "stoptime"
    t.integer "counttrue"
    t.integer "totaltime"
    t.integer "questionsall"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "numberrand", array: true
    t.index ["topic_id"], name: "index_consents_on_topic_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.integer "age"
    t.text "telephone"
    t.text "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "creators", force: :cascade do |t|
    t.string "namecreator"
    t.string "surnamecreator"
    t.string "telephonecreator"
    t.string "emailcreator"
    t.string "promocodecreator"
    t.string "photocreator"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "companycreator"
    t.integer "idreg"
  end

  create_table "passwords", force: :cascade do |t|
    t.string "pasanswer"
    t.string "pasvalue"
    t.integer "pascount"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "userid"
    t.index ["topic_id"], name: "index_passwords_on_topic_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "titlequestion"
    t.text "imgquestion"
    t.text "answertrue"
    t.text "answer2"
    t.text "answer3"
    t.text "answer4"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_questions_on_topic_id"
  end

  create_table "settings", force: :cascade do |t|
    t.integer "agebefore"
    t.integer "ageafter"
    t.text "accomplishment"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "sex"
    t.text "country"
    t.index ["topic_id"], name: "index_settings_on_topic_id"
  end

  create_table "statisticscreators", force: :cascade do |t|
    t.integer "idreg"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "test", array: true
    t.integer "survey", array: true
  end

  create_table "topics", force: :cascade do |t|
    t.string "titletopic"
    t.integer "countquestions"
    t.integer "sucquest"
    t.text "password"
    t.text "ip"
    t.text "email"
    t.text "typetopic"
    t.text "activ"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "successmessage"
    t.text "failuremessage"
    t.integer "idreg"
    t.time "timetask"
    t.datetime "intdate1"
    t.datetime "intdate2"
    t.string "rand"
  end

  create_table "usernames", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_usernames_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usernames_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usertabls", force: :cascade do |t|
    t.integer "userid"
    t.bigint "topic_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["topic_id"], name: "index_usertabls_on_topic_id"
  end

  create_table "visitors", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.string "telephone"
    t.datetime "birthdate"
    t.string "photo"
    t.string "promocode"
    t.string "country"
    t.string "city"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "idregvis"
    t.string "sex"
  end

  add_foreign_key "answers", "topics"
  add_foreign_key "consents", "topics"
  add_foreign_key "passwords", "topics"
  add_foreign_key "questions", "topics"
  add_foreign_key "settings", "topics"
  add_foreign_key "usertabls", "topics"
end
