require 'spec_helper'

describe OpsController do
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
