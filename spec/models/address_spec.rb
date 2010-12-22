require 'spec_helper'

describe Address do
  it "should have a zipcode" do
    stew = 	Steward.create(:email => 'e@email.com',:password => 'pass')
    stew.build_address(:public_name => 'Curtis', :zipcode => '94102',:public_location_name => 'Hayes Valley Farm')
    assert {
      stew.address.zipcode == '94102'
      
    }
  end
  it "should have a public_location_name" do
    stew = 	Steward.create(:email => 'e@email.com',:password => 'pass')
    stew.build_address(:public_name => 'Curtis', :zipcode => '94102',:public_location_name => 'Hayes Valley Farm')
    assert {
      stew.address.public_location_name == 'Hayes Valley Farm'
      
    }
  end
  it "should have a public_name" do
    stew = 	Steward.create(:email => 'e@email.com',:password => 'pass')
    stew.build_address(:public_name => 'Curtis', :zipcode => '94102',:public_location_name => 'Hayes Valley Farm')
    assert {
      stew.address.public_name == 'Curtis'
      
    }
  end
end
