require 'spec_helper'

describe Address do
  let(:stew) do
    stew = Factory(:steward)
    stew.build_address(:public_name => 'Curtis', :zipcode => '94102',:public_location_name => 'Hayes Valley Farm')
    stew
  end
  it "should have a zipcode" do
    assert {
      stew.address.zipcode == '94102'
    }
  end
  it "should have a public_location_name" do
    assert {
      stew.address.public_location_name == 'Hayes Valley Farm'
    }
  end
  it "should have a public_name" do
    assert {
      stew.address.public_name
    }
  end
end
