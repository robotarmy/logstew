require 'spec_helper'
describe Log do
  let(:my) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s, 
                     :public_location_name => 'Home',
                     :zipcode => '94102')
    s
  end
  let(:log) do
    my.logs.create(:story => 'storytime')
  end
  context "log in" do
    before(:each) do
      visit(steward_session_path)
      fill_in 'steward[email]', :with => my.email
      fill_in 'steward[password]', :with => 'histewry'
      click_button 'enter'
    end
    context "sidebar page" do
      it "has title link" do
        visit(steward_logs_path(log.steward))
        page.should have_css('.starboard .log .title a')
      end
      it "has username link" do
        visit(steward_logs_path(log.steward))
        page.should have_css('.starboard .log .name a', :text => log.steward.name)
        click_link(log.steward.name)
        current_path.should == steward_logs_path(log.steward)
      end
    end
  end
end

