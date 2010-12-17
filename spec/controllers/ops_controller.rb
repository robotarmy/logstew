require 'spec_helper'

describe OpsController do
  describe "routes" do
    it "should properly route" do
      {:get, "/op/host"}.should route_to(:controller => "ops", :action => "host")
      {:get, "/op/git"}.should route_to(:controller => "ops", :action => "git")
    end
  end
  it "has #host" do
    get :host 
    assert {
      response.body =~ %x{hostname}
    }
  end
  it "has #git" do
    get :git
    assert {
      response.body =~ %x{git log HEAD~1..HEAD}
    }
  end
end
