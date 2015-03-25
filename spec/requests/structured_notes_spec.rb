require 'rails_helper'

RSpec.describe "StructuredNotes", :type => :request do
  describe "GET /structured_notes" do
    it "works! (now write some real specs)" do
      get structured_notes_path
      expect(response).to have_http_status(200)
    end
  end
end
