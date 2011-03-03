require 'spec_helper'

describe Log do
  let(:steward) do
    Factory(:steward)
  end

  let(:log) do
    steward.logs.create(:story => 'hi')
  end
  context "creator_name" do
    it "is the steward who  made the log" do
      log.creator_name.should == steward.name
    end
  end
end
