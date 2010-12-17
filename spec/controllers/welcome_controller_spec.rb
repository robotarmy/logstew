require 'spec_helper'

describe WelcomeController do
  it "index" do
    get :index
    assert {
      response.status == 200
    }
  end
end
