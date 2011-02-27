require 'spec_helper'
describe Log do
  let(:me) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s, 
                     :public_location_name => 'Home',
                     :zipcode => '94102')
    s
  end
  let(:another) do
    s = Factory(:steward)

    s.create_address(:public_name => :amber.to_s, 
                     :public_location_name => 'Home',
                     :zipcode => '94118')
    s
  end

  let(:log) do
    me.logs.create(:story => 'storytime', :title => 'cake is nice')
  end

  let(:another_log) do
    another.logs.create(:story => 'timestore', :title => 'lets grow beans')
  end

  context "log in" do
    before(:each) do
      sign_in me
    end
    context "sidebar page" do
      it "has recent posts" do
        visit(steward_logs_path(log.steward))
        page.save_and_open_page
        within('.starboard .log') do
          page.should have_content(log.title)
          page.should have_content(log.steward.name)
          page.should have_content(another_log.title)
          page.should have_content(another_log.steward.name)
        end
      end
      it "has title link" do
        visit(steward_logs_path(log.steward))
        page.should have_css('.starboard .log .title a', :text => log.title)
        click_link(log.title)
        current_path.should == steward_log_path(log.steward,log)
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

