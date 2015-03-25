class StructuredNote < ActiveRecord::Base
  has_many :structured_note_references
  has_many :sub_structured_notes, :through => :structured_note_references
end
