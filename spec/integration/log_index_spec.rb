require 'spec_helper'

describe "Log Index Page -" do
  let(:steward) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s)
    s
  end

  let(:log) do
    Factory(:log, :story => 'storytime')
  end

  context "After login," do
    before(:each) do
      sign_in steward
    end

    context " your log index page" do
      it "shows entries by you" do
        pending
      end
    end
  end
end

