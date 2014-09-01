class AlterProblems < ActiveRecord::Migration
  def change
    remove_column :problems, :template_file
    remove_column :problems, :last_answer
    remove_column :problems, :status
    add_column :problems, :parent_problem, :integer
  end
end
