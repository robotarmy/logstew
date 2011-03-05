require 'spec_helper'
describe "Log Show Page -" do
  let(:wilma) do
    s = Factory(:steward)
    s.create_address(:public_name => :Wilma.to_s)
    s
  end

  let(:me) do
    s = Factory(:steward)
    s.create_address(:public_name => :Curtis.to_s)
    s
  end

  let(:log) do
    wilma.logs.create(:story => 'Story Time')
  end

  context "After Sign in as Curtis" do
    before(:each) do
      sign_in me
    end
    context "I can see a log by Wilma" do
      it "and navigate to the rest of her entries" do
        visit(steward_log_path(log.steward,log))
        page.save_and_open_page
        page.should have_content("Wilma's stewardship journal")
        page.should have_link("Wilma's stewardship journal")
        click_link "see more journal entries by #{log.creator_name}"
        page.should have_content("stewardship journal")
        page.should have_content(log.story)
      end
    end
  end
end
