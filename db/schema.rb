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

ActiveRecord::Schema[8.1].define(version: 2026_06_02_134342) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string "allergy_type"
    t.datetime "created_at", null: false
    t.date "diagnosed_date"
    t.bigint "family_member_id", null: false
    t.string "name"
    t.text "notes"
    t.string "severity"
    t.datetime "updated_at", null: false
    t.index ["family_member_id"], name: "index_allergies_on_family_member_id"
  end

  create_table "checkups", force: :cascade do |t|
    t.string "checkup_type"
    t.datetime "created_at", null: false
    t.date "date"
    t.bigint "family_member_id", null: false
    t.text "notes"
    t.text "results"
    t.datetime "updated_at", null: false
    t.index ["family_member_id"], name: "index_checkups_on_family_member_id"
  end

  create_table "doctor_visits", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "doctor_city"
    t.string "doctor_name"
    t.bigint "family_member_id", null: false
    t.bigint "illness_id"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.date "visit_date"
    t.string "visit_type"
    t.index ["family_member_id"], name: "index_doctor_visits_on_family_member_id"
    t.index ["illness_id"], name: "index_doctor_visits_on_illness_id"
  end

  create_table "families", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "name"
    t.datetime "updated_at", null: false
  end

  create_table "family_members", force: :cascade do |t|
    t.string "blood_type"
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.bigint "family_id", null: false
    t.boolean "is_private"
    t.string "member_type"
    t.string "name"
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["family_id"], name: "index_family_members_on_family_id"
    t.index ["user_id"], name: "index_family_members_on_user_id"
  end

  create_table "illnesses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "family_member_id", null: false
    t.string "name"
    t.text "notes"
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["family_member_id"], name: "index_illnesses_on_family_member_id"
  end

  create_table "medications", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "end_date"
    t.bigint "family_member_id", null: false
    t.bigint "illness_id"
    t.string "medication_type"
    t.string "name"
    t.text "notes"
    t.date "start_date"
    t.datetime "updated_at", null: false
    t.index ["family_member_id"], name: "index_medications_on_family_member_id"
    t.index ["illness_id"], name: "index_medications_on_illness_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.bigint "family_id"
    t.datetime "remember_created_at"
    t.datetime "reset_password_sent_at"
    t.string "reset_password_token"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["family_id"], name: "index_users_on_family_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vaccines", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "dose_number"
    t.bigint "family_member_id", null: false
    t.string "name"
    t.date "next_due_date"
    t.text "notes"
    t.datetime "updated_at", null: false
    t.date "vaccine_date"
    t.index ["family_member_id"], name: "index_vaccines_on_family_member_id"
  end

  add_foreign_key "allergies", "family_members"
  add_foreign_key "checkups", "family_members"
  add_foreign_key "doctor_visits", "family_members"
  add_foreign_key "doctor_visits", "illnesses"
  add_foreign_key "family_members", "families"
  add_foreign_key "family_members", "users"
  add_foreign_key "illnesses", "family_members"
  add_foreign_key "medications", "family_members"
  add_foreign_key "medications", "illnesses"
  add_foreign_key "users", "families"
  add_foreign_key "vaccines", "family_members"
end
