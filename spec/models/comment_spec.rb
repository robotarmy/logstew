require 'spec_helper'

describe Comment do

  let(:author) do
    Factory(:steward)
  end

  let(:log) do
    Factory(:log, :story => 'I made a log')
  end

  context "cannot be created " do
    let(:comment) do
      Comment.new
    end

    it "without a body" do
      comment.log = log
      comment.author = author
    end

    it "without a log" do
      comment.body = 'hola'
      comment.author = author
    end

    it "without a author" do
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
      Comment.new(:author => author,
                  :log => log, 
                  :body => '')
    end

    it "has a log" do
      comment.log.should == log
      comment.log_id.should == log.id
    end

    it "has an author who is different than the log's steward" do
      comment.author.should ==  author
      comment.author_id.should == author.id
    end

    it "can be saved if it has a non-empty body" do
      comment.body = 'hi that is cool'
      lambda {
        comment.save!
      }.should_not raise_error
    end
  end

  context "are accessable" do
    let(:log2) do
      Factory(:log, :story => 'hi')
    end

    before do
      @a = Comment.create! :author => author,  :log => log, :body => 'hello'
      @b = Comment.create! :author => author,  :log => log, :body => 'hola'
      @c = Comment.create! :author => author,  :log => log2, :body => 'eat it'
    end

    it "from log" do
      log.comments.should == [@a,@b]
    end
  end
end
