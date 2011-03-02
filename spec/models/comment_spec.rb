require 'spec_helper'

describe Comment do
  let(:steward) do
    Factory(:steward)
  end

  let(:log) do
    Factory(:steward).logs.create(:story => 'I made a log')
  end

  context "cannot be created " do
    let(:comment) do
      Comment.new
    end

    it "without a body" do
      comment.log = log
      comment.creator = steward
    end

    it "without a log" do
      comment.body = 'hola'
      comment.creator = steward
    end

    it "without a creator" do
      comment.body = 'hola'
      comment.log = log
    end

    after do
      lambda {
        comment.save!
      }.should raise_error
    end
  end

  context "made by a steward and about a log" do
    let(:comment) do
      Comment.new(:creator => steward, :log => log, :body => '')
    end

    it "has a log" do
      comment.log.should == log
      comment.log_id.should == log.id
    end

    it "has a creator" do
      comment.creator.should == steward
      comment.creator_id.should == steward.id
    end

    it "can be saved if it has a non-empty body" do
      comment.body = 'hi that is cool'
      lambda {
        comment.save!
      }.should_not raise_error
    end
  end
  context "are accessable" do
    before do
      @a = Comment.create! :creator => steward, :log => log, :body => 'hello'
      @b = Comment.create! :creator => steward, :log => log, :body => 'hola'
      @c = Comment.create! :creator => steward, :log => log, :body => 'bonjour'
    end

    it "from log" do
      log.comments.should == [@a,@b,@c]
    end
  end
end
