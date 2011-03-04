require 'spec_helper'
describe Comment do
  let(:steward) do
    s = Factory(:steward)
  end
  let(:author) do
    sam = Factory(:steward)
    sam.create_address(:public_name => :sam.to_s)
    sam
  end

  let(:log) do
    Factory(:log, :story => 'storytime')
  end

  context "log in" do
    before(:each) do
      sign_in author
    end
      it "and post a comment on my own log entry" do
        visit steward_log_path(log.steward,log)
        page.save_and_open_page
        fill_in 'comment[body]', :with => 'Nice plants'
        click_button 'Post'
        current_path.should == steward_log_path(log.steward,log)
        within '.log .comment' do
          page.should have_css('.author a', :text => author.name)
          page.should have_css('.body', :text => 'Nice plants')
        end
      end
  end
end


