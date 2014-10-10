class InitSchema < ActiveRecord::Migration
  def up

    create_table "assignment_problems", force: true do |t|
      t.integer  "assignment_id"
      t.integer  "problem_id"
      t.decimal  "grade"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "seed"
    end

    create_table "assignment_types", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "assignments", force: true do |t|
      t.string  "name"
      t.integer "assignment_type_id"
      t.integer "course_id"
      t.integer "max_attempts"
    end

    add_index "assignments", ["course_id"], name: "index_assignments_on_course_id"

    create_table "course_users", force: true do |t|
      t.integer  "course_id"
      t.integer  "user_id"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "course_users", ["course_id", "user_id"], name: "index_course_users_on_course_id_and_user_id", unique: true

    create_table "courses", force: true do |t|
      t.string   "name"
      t.datetime "start_datetime"
      t.datetime "end_datetime"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "group_users", force: true do |t|
      t.integer  "group_id",   null: false
      t.integer  "user_id",    null: false
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    add_index "group_users", ["group_id", "user_id"], name: "index_group_users_on_group_id_and_user_id", unique: true

    create_table "groups", force: true do |t|
      t.string   "name"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "problems", force: true do |t|
      t.integer  "value"
      t.string   "major_topic"
      t.string   "minor_topic"
      t.string   "tags"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", force: true do |t|
      t.string   "email",                  default: "", null: false
      t.string   "encrypted_password",     default: "", null: false
      t.string   "reset_password_token"
      t.datetime "reset_password_sent_at"
      t.datetime "remember_created_at"
      t.integer  "sign_in_count",          default: 0,  null: false
      t.datetime "current_sign_in_at"
      t.datetime "last_sign_in_at"
      t.string   "current_sign_in_ip"
      t.string   "last_sign_in_ip"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "roles_mask"
      t.string   "first_name"
      t.string   "last_name"
    end

    add_index "users", ["email"], name: "index_users_on_email", unique: true
    add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  end

  def down
    raise "Can not revert initial migration"
  end
end
