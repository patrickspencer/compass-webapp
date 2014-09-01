class CreateAssignmentProblems < ActiveRecord::Migration
  def change
    create_table :assignment_problems do |t|
      t.belongs_to :assignment
      t.belongs_to :problem
      t.timestamps
    end
  end
end
