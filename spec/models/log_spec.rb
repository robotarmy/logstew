require 'spec_helper'

describe Log do
  context "creator_name" do
    it "is the steward who  made the log" do
      stew = Factory(:steward)
      log = stew.logs.create(:story => 'hi')
      log.creator_name.should == stew.name
    end
  end
end
