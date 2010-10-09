require "spec_helper"

describe ThingsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/things" }.should route_to(:controller => "things", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/things/new" }.should route_to(:controller => "things", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/things/1" }.should route_to(:controller => "things", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/things/1/edit" }.should route_to(:controller => "things", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/things" }.should route_to(:controller => "things", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/things/1" }.should route_to(:controller => "things", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/things/1" }.should route_to(:controller => "things", :action => "destroy", :id => "1")
    end

  end
end
