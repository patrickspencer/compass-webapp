class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :user_id
      t.integer :problem_id
      t.string :value
      t.datetime :created_at
    end
  end
end
