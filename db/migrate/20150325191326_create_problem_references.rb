class CreateProblemReferences < ActiveRecord::Migration
  def change
    create_table :problem_references do |t|
      t.integer :problem_id
      t.integer :sub_problem_id

      t.timestamps null: false
    end
  end
end
