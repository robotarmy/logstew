Feature: I can sign in 

Scenario: I'm a new steward interested in logging
Given I am on the home page
When I fill in "steward[email]" with "newlogstew@robotarmyma.de"
And I fill in "steward[password]" with "testtest" 
Then I should see "Steward Log"

