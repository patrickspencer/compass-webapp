class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.datetime :start_datetime
      t.datetime :end_datetime
      t.timestamps
    end
  end
end
