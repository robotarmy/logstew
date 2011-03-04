require 'spec_helper'

describe Log do
  let(:log) do
    Factory(:log)
  end
  context "creator_name" do
    it "is the steward who  made the log" do
      log.creator_name.should == log.steward.name
    end
  end
end
