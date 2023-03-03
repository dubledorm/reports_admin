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

ActiveRecord::Schema.define(version: 2023_03_01_142006) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "report_executions", force: :cascade do |t|
    t.bigint "report_id", null: false
    t.integer "report_status"
    t.datetime "report_run_date"
    t.datetime "report_end_date"
    t.text "report_error"
    t.integer "send_status"
    t.datetime "send_run_date"
    t.datetime "send_end_date"
    t.integer "send_count"
    t.text "send_error"
    t.index ["report_end_date"], name: "index_report_executions_on_report_end_date"
    t.index ["report_id"], name: "index_report_executions_on_report_id"
    t.index ["report_run_date"], name: "index_report_executions_on_report_run_date"
    t.index ["report_status"], name: "index_report_executions_on_report_status"
    t.index ["send_count"], name: "index_report_executions_on_send_count"
    t.index ["send_end_date"], name: "index_report_executions_on_send_end_date"
    t.index ["send_run_date"], name: "index_report_executions_on_send_run_date"
    t.index ["send_status"], name: "index_report_executions_on_send_status"
  end

  create_table "report_files", force: :cascade do |t|
    t.bigint "report_execution_id", null: false
    t.string "file_id"
    t.string "file_name"
    t.string "file_path"
    t.index ["file_id"], name: "index_report_files_on_file_id"
    t.index ["report_execution_id"], name: "index_report_files_on_report_execution_id"
  end

  create_table "reports", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "enabled"
    t.string "alert_interval"
    t.string "report_string"
    t.string "transport_string"
    t.index ["enabled"], name: "index_reports_on_enabled"
    t.index ["name"], name: "index_reports_on_name", unique: true
  end

  add_foreign_key "report_executions", "reports"
  add_foreign_key "report_files", "report_executions"
end
