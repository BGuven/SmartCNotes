require 'rails_helper'

RSpec.describe StructuredNote, :type => :model do
  it "creates a new StructuredNote" do 
    structured_note = StructuredNote.new()
    expect(structured_note).to be_a StructuredNote
  end

  it "creates a StructuredNote with attributes" do
    structured_note_hash = {name:'Diarrhea', dx:'diagnosis test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}
    structured_note = StructuredNote.create!(structured_note_hash)
    expect(structured_note.name).to eq(structured_note_hash[:name])
    expect(structured_note.dx).to eq(structured_note_hash[:dx])
    expect(structured_note.tx).to eq(structured_note_hash[:tx])
    expect(structured_note.cause_desc).to eq(structured_note_hash[:cause_desc])
    expect(structured_note.prognosis).to eq(structured_note_hash[:prognosis])
  end

  it "creates a StructuredNote with SubStructuredNotes" do
    structured_note_hash_1 = {name:'Diarrhea', dx:'diagnosis test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}
    structured_note_hash_2 = {name:'Fever Nyd', dx:'fever test' , tx:'treatment test', cause_desc:'description test', prognosis:'prognosis_test'}

    structured_note1 = StructuredNote.create!(structured_note_hash_1)
    structured_note2 = StructuredNote.create!(structured_note_hash_2)

    structured_note1.structured_note_references.build(:sub_structured_note_id => structured_note2.id) 

    expect(structured_note1.structured_note_references.first.sub_structured_note.name).to eq(structured_note_hash_2[:name])
  end
end