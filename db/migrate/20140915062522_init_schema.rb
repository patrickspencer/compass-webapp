class InitSchema < ActiveRecord::Migration
  def up
    create_table :assignment_types, force: true do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :assignments, force: true do |t|
      t.string   :name
      t.integer  :assignment_type_id
      t.integer  :course_id
      t.integer  :max_problem_attempts
      t.datetime :start_datetime
      t.datetime :due_datetime
      t.datetime :reduced_credit_due_datetime
    end

    add_index :assignments, [:course_id], name: :index_assignments_on_course_id

    create_table :course_users, force: true do |t|
      t.integer  :course_id
      t.integer  :user_id
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :course_users, [:course_id, :user_id], name: :index_course_users_on_course_id_and_user_id, unique: true

    create_table :courses, force: true do |t|
      t.string   :name
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :group_users, force: true do |t|
      t.integer  :group_id,   null: false
      t.integer  :user_id,    null: false
      t.datetime :created_at
      t.datetime :updated_at
    end

    add_index :group_users, [:group_id, :user_id], name: :index_group_users_on_group_id_and_user_id, unique: true

    create_table :groups, force: true do |t|
      t.string   :name
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :problems, force: true do |t|
      t.string   :user_id
      t.string   :assignment_id
      t.string   :value
      t.integer  :seed
      t.string   :grade
      t.string   :attempts
      t.datetime :created_at
      t.datetime :updated_at
      t.belongs_to :user
      t.belongs_to :assignment
      t.belongs_to :problem_template
    end

    create_table :problem_templates, force: true do |t|
      t.string   :value
      t.string   :major_topic
      t.string   :minor_topic
      t.string   :tags
      t.datetime :created_at
      t.datetime :updated_at
    end

    create_table :users, force: true do |t|
      t.string   :email,                  default: "", null: false
      t.string   :id_string,                 default: "", null: false
      t.string   :encrypted_password,     default: "", null: false
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          default: 0,  null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :first_name
      t.string   :last_name
    end

    add_index :users, [:id_string], name: :index_users_on_id_string, unique: true
    add_index :users, [:email], name: :index_users_on_email, unique: true
    add_index :users, [:reset_password_token], name: :index_users_on_reset_password_token, unique: true

  end

  def down
    raise "Can not revert initial migration"
  end
end
