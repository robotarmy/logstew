require 'spec_helper'
describe Log do
  let(:steward) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s)
    s
  end

  let(:log) do
    steward.logs.create(:story => 'storytime')
  end

  context "log in" do
    before(:each) do
      sign_in steward
    end

    context "index page" do
      it "has more entries by the same creator" do
        pending

      end
    end
  end
end

