class CreateUserProblems < ActiveRecord::Migration
  def change
    create_table :user_problems do |t|

      t.timestamps
    end
  end
end
