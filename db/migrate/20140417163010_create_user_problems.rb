class CreateUserProblems < ActiveRecord::Migration
  def change
    create_table :user_problems do |t|
      t.string  :template_file
      t.integer :random_seed
      t.integer :value
      t.string  :status
      t.string  :max_attempts
      t.boolean :attempted?
      t.string  :last_answer
      t.integer :number_correct
      t.integer :number_incorrect
      t.belongs_to :user
      t.timestamps
    end
  end
end
