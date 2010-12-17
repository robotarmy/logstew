require 'spec_helper'

describe Address do
  it "should have a zipcode" do
    stew = 	Steward.create(:email => 'e@email.com',:password => 'pass')
    stew.build_address(:zipcode => '94102',:street => 'Laguna & Fell', :name => 'Hayes Valley Farm')
    assert {
      stew.address.zipcode == '94102'
    }
  end
end
