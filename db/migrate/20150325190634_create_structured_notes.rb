class CreateStructuredNotes < ActiveRecord::Migration
  def change
    create_table :structured_notes do |t|
      t.string :name
      t.text :dx
      t.text :tx
      t.text :cause_desc
      t.text :prognosis

      t.timestamps null: false
    end
  end
end
