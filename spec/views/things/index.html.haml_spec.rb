require 'spec_helper'

describe "things/index.html.haml" do
  before(:each) do
    assign(:things, [
      stub_model(Thing),
      stub_model(Thing)
    ])
  end

  it "renders a list of things" do
    render
  end
end
