class CreateCourseUsers < ActiveRecord::Migration
  def change
    create_table :course_users do |t|
      t.belongs_to :course
      t.belongs_to :user
      t.timestamps
    end

    add_index :course_users, [:course_id, :user_id], unique: true
  end
end
