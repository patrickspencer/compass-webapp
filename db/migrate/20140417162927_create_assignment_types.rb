class CreateAssignmentTypes < ActiveRecord::Migration
  def change
    create_table :assignment_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
