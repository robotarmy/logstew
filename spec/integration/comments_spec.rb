require 'spec_helper'
describe Log do
  let(:steward) do
    s = Factory(:steward)
    s.create_address(:public_name => :sam.to_s)
    s
  end
  let(:log) do
    steward.logs.create(:story => 'storytime')
  end
  context "log in" do
    before(:each) do
      sign_in steward
    end
      it "and post a comment on my own log entry" do
        visit steward_log_path(log.steward,log)
        page.save_and_open_page
        fill_in 'comment[body]', :with => 'Nice plants'
        click_button /Post/i
        within '.log .comments' do
          page.should have_css('.name a', :text => steward.name)
          page.should have_css('.comment', :text => 'Nice plants')
        end
      end
  end
end


