Feature: I can sign in and make a new log 

Background:
Given I am signed out

Scenario: I'm a new steward interested in logging
Given I am on the home page
When I fill in "steward[email]" with "newlogstew@robotarmyma.de" within "#sign_up"
And I press "Sign Up!"
Then I should see "Create Log"

