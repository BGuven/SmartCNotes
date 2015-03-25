require "rails_helper"

RSpec.describe StructuredNotesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/structured_notes").to route_to("structured_notes#index")
    end

    it "routes to #new" do
      expect(:get => "/structured_notes/new").to route_to("structured_notes#new")
    end

    it "routes to #show" do
      expect(:get => "/structured_notes/1").to route_to("structured_notes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/structured_notes/1/edit").to route_to("structured_notes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/structured_notes").to route_to("structured_notes#create")
    end

    it "routes to #update" do
      expect(:put => "/structured_notes/1").to route_to("structured_notes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/structured_notes/1").to route_to("structured_notes#destroy", :id => "1")
    end

  end
end
