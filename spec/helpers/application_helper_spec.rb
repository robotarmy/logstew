require 'spec_helper'

describe ApplicationHelper do
  before do
    @steward = Factory(:steward)
    @steward.logs.create(:story => 'hiy')
    @steward1 = Factory(:steward)
    @steward1.logs.create(:story => 'soup')
  end
  it '#get_recent_logs' do
    helper.get_recent_logs.should == [@steward.logs.first,@steward1.logs.first]
  end

  it "#render_last_post" do
    helper.render_last_posts.should match(/#{@steward.logs.first.title}/)
    helper.render_last_posts.should match(/#{@steward1.logs.first.title}/)
  end
end
