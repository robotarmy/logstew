require 'spec_helper'

describe 'Feedback index' do
  describe 'when logged out' do
    it "cannot be accessed" do
      visit feedback_index_path
      current_path.should == new_steward_session_path
    end
  end

  describe 'when logged in' do
    it "list feedback" do
      current_steward = Factory(:steward)
      sign_in current_steward
      Factory(:feedback, :comment => "feedback link is hard to find", :answers => {"what page are you on"=> "comment"})
      Factory(:feedback, :comment => "hello world!", :answers => {"what is your favorite color"=> "blue"},
              :page_url => root_path,
              :steward_email => current_steward.email)
      visit feedback_index_path
      page.should have_css(".feedback .steward_email", :text => current_steward.email)
      page.should have_css(".feedback .page_url", :text => root_path)
      page.should have_css(".feedback .comment", :text => "hello world!")
      page.should have_css(".feedback .question", :text => "what page are you on")
      page.should have_css(".feedback .answer", :text => "comment")
    end
  end
end
