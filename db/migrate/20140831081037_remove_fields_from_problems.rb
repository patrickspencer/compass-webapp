class RemoveFieldsFromProblems < ActiveRecord::Migration
  def change
    remove_column :problems, :random_seed
    remove_column :problems, :attempted?
    remove_column :problems, :number_correct
    remove_column :problems, :number_incorrect
    remove_column :problems, :user_id
  end
end
