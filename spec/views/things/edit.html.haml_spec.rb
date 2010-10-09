require 'spec_helper'

describe "things/edit.html.haml" do
  before(:each) do
    @thing = assign(:thing, stub_model(Thing,
      :new_record? => false
    ))
  end

  it "renders the edit thing form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => thing_path(@thing), :method => "post" do
    end
  end
end
