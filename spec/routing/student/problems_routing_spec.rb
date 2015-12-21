require "rails_helper"

RSpec.describe Student::ProblemsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/student/problems").to route_to("student/problems#index")
    end

    it "routes to #new" do
      expect(:get => "/student/problems/new").to route_to("student/problems#new")
    end

    it "routes to #show" do
      expect(:get => "/student/problems/1").to route_to("student/problems#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/student/problems/1/edit").to route_to("student/problems#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/student/problems").to route_to("student/problems#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/student/problems/1").to route_to("student/problems#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/student/problems/1").to route_to("student/problems#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/student/problems/1").to route_to("student/problems#destroy", :id => "1")
    end

  end
end
