class RenameUserProblemsToProblems < ActiveRecord::Migration
  def change
    rename_table :user_problems, :problems
  end
end
