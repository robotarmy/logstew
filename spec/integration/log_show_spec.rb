require 'spec_helper'
describe Log do
  let(:wilma) do
    s = Factory(:steward)
    s.create_address(:public_name => :wilma.to_s)
    s
  end
  let(:me) do
    s = Factory(:steward)
    s.create_address(:public_name => :curtis.to_s)
    s
  end
  let(:log) do
    wilma.logs.create(:story => 'storytime')
  end
  context "log in" do
    before(:each) do
      sign_in me
    end
    context "wilmas show page" do
      it "has more entries by the same creator" do
        visit(steward_log_path(log.steward,log))
        page.should have_content("Wilma's stewardship journal")
        page.should have_link("Wilma's stewardship journal")
        click_link "see more journal entries by #{log.creator_name}"
        page.should have_content("stewardship journal")
        page.should have_content('storytime')
      end
    end
  end
end
