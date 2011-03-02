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
  context "comments" do
    before do
      Comment.create! :creator => steward, :log => log, :body => 'hello'
      Comment.create! :creator => steward, :log => log, :body => 'hola'
      Comment.create! :creator => steward, :log => log, :body => 'bonjour'
    end
    it "belong to a log" do
    end
  end
end
