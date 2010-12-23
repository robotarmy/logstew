require 'spec_helper'

describe Steward do
  let(:steward) do
    Factory(:steward)
  end
  context "address" do
    it "does not have complete_addreess?" do
      steward.build_address()
      assert {
        steward.complete_address? == false
      }
      steward.build_address(:public_name => 'Tom')

      assert {
        steward.complete_address? == false
      }
      steward.build_address(:public_name => "Tom",
                            :public_location_name => "Tom's Place")

      assert {
        steward.complete_address? == false
      }
    end
    it "has a complete_address?" do
      steward.build_address(:zipcode => "94108",
                            :public_name => "Tom",
                            :public_location_name => "Tom's Place")

      assert {
        steward.complete_address? == true
      }
    end
  end
end
