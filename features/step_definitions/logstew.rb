Given /^I am signed out$/ do
Given 'I am on the destroy_steward_session page'
end

Given /^I am a steward with email "([^"]*)" and password "([^"]*)"$/ do |email, password|
stew = Given "I am a steward with email \"#{email}\" and password \"#{password}\" and no address"
stew.create_address(:name => 'Hayes Valley Farm',:zipcode => '94102')
end

Given /^I am a steward with email "([^"]*)" and password "([^"]*)" and no address$/ do |email, password|
  Steward.create!(:email => email, :password => password, :password_confirmation => password)
end

Given /^I sign in as "([^"]*)" with "([^"]*)"$/ do |email, password|
Given 'I am on the home page'
Then 'I should see "You can join and start"'
When 'I fill in "steward[email]" with "exist@robotarmyma.de" within "#sign_in"'
When 'I fill in "steward[password]" with "exist" within "#sign_in"'
And 'I press "enter"'
end
