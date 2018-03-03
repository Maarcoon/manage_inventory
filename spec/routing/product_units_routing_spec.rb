require "rails_helper"

RSpec.describe ProductUnitsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/product_units").to route_to("product_units#index")
    end

    it "routes to #new" do
      expect(:get => "/product_units/new").to route_to("product_units#new")
    end

    it "routes to #show" do
      expect(:get => "/product_units/1").to route_to("product_units#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/product_units/1/edit").to route_to("product_units#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/product_units").to route_to("product_units#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/product_units/1").to route_to("product_units#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/product_units/1").to route_to("product_units#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/product_units/1").to route_to("product_units#destroy", :id => "1")
    end

  end
end
