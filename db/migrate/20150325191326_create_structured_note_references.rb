class CreateStructuredNoteReferences < ActiveRecord::Migration
  def change
    create_table :structured_note_references do |t|
      t.integer :structured_note_id
      t.integer :sub_structured_note_id

      t.timestamps null: false
    end
  end
end
