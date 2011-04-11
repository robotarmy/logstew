require 'spec_helper'
describe 'Feedback form' do
  describe "logged out" do
    before do
      visit root_path
    end

    it "is not visible by default" do
      page.should_not have_content('Send Feedback')
    end
    it "has a feedback link in the title" do
      click_on "Give us Feedback"
      comment =%%
    This is my feeback that is longer
    I would like it to be greater than 255 characters
    and all that #{"*" * 255}%
    lambda do 
      Feedback.questions.each_with_index do |q, i|
        fill_in %%feedback[answers][#{q}]%, :with => %%I like green..#{i}%
      end
      fill_in 'feedback[comment]', :with => comment
      click_on 'Send Feedback'
    end.should change(Feedback,:count).by(1)
    Feedback.last.page_url.should == root_path
    end
    it "visits the same page as was on before - root path" do
      click_on "Give us Feedback"
      click_on 'Send Feedback'
      current_path.should == root_path
    end
  end

  describe "as logged in" do
    let(:steward) do
      Factory(:steward)
    end
    before do
      sign_in steward
      visit steward_logs_path(steward)
      click_on 'Give us Feedback'
    end

    it "encodes a steward email" do
      page.should have_css('#feedback_steward_email', :value => steward.email)
    end

    it "redirects to same page as before after post" do
      click_on 'Send Feedback'
      current_path.should == steward_logs_path(steward)
    end

    it "uses page url according to the page the form displays on" do
      page.should have_css('#feedback_page_url', :value => steward_logs_path(steward))
    end
  end
end
