require 'spec_helper'
describe Log do
  let(:wilma) do
    s = Factory(:steward, :email => 'wilma@example.com')
    s.create_address(:public_name => :wilma.to_s)
    s
  end
  let(:my) do
    s = Factory(:steward)
    s.create_address(:public_name => :curtis.to_s)
    s
  end
  let(:log) do
    wilma.logs.create(:story => 'storytime')
  end
  context "log in" do
    before(:each) do
      visit(steward_session_path)
      fill_in 'steward[email]', :with => my.email
      fill_in 'steward[password]', :with => 'histewry'
      click_button 'enter'
    end
    context "wilmas show page" do
      it "has more entries by the same creator" do
        visit(steward_log_path(log.steward,log))
        debugger
        page.should have_content("Wilma's stewardship journal")
        click_link "see more journal entries by #{log.creator_name}"
        page.should have_content("stewardship journal")
      end
    end
  end
end
