require "rails_helper"

RSpec.describe CoffeeshopsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/coffeeshops").to route_to("coffeeshops#index")
    end

    it "routes to #new" do
      expect(:get => "/coffeeshops/new").to route_to("coffeeshops#new")
    end

    it "routes to #show" do
      expect(:get => "/coffeeshops/1").to route_to("coffeeshops#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/coffeeshops/1/edit").to route_to("coffeeshops#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/coffeeshops").to route_to("coffeeshops#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/coffeeshops/1").to route_to("coffeeshops#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/coffeeshops/1").to route_to("coffeeshops#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/coffeeshops/1").to route_to("coffeeshops#destroy", :id => "1")
    end

  end
end
