class StructuredNoteReference < ActiveRecord::Base
  belongs_to :structured_note
  belongs_to :sub_structured_note, :class_name => 'StructuredNote'
end
