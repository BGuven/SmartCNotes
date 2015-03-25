class CreateProblems < ActiveRecord::Migration
  def change
    create_table :problems do |t|
      t.string :name
      t.text :dx
      t.text :tx
      t.text :cause_desc
      t.text :prognosis

      t.timestamps null: false
    end
  end
end
