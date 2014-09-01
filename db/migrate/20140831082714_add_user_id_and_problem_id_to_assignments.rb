class AddUserIdAndProblemIdToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :user_id, :integer
    add_index  :assignments, :user_id
    add_column :assignments, :problem_id, :integer
    add_index  :assignments, :problem_id
  end
end
