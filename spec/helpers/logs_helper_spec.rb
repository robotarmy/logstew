require 'spec_helper'

# Specs in this file have access to a helper object that includes
# the LogsHelper. For example:
#
# describe LogsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       helper.concat_strings("this","that").should == "this that"
#     end
#   end
# end
describe LogsHelper do
  describe 'logs title' do
    let(:me) do
      f = Factory(:steward)
      f.create_address(:public_name => "me")
      f
    end
    let(:you) do
      f = Factory(:steward, :email => 'is_factory_girl@broken.com')
      f.create_address(:public_name => "you")
      f
    end
    it "is my logs" do
      @steward = me
      helper.should_receive(:current_steward).and_return(me)
      assert {
        helper.logs_title_for(@steward).scan(/'My stewardship journal'/)
      }
    end
    it "is your logs" do
      @steward = you
      helper.should_receive(:current_steward).and_return(me)
      assert {
        helper.logs_title_for(@steward).scan(/"You's stewardship journal"/)
      }
    end

  end
end
