Feature: A Steward Logs in and doesn't have an address set - they need to set their address

Background:
Given I am signed out
Given I am a steward with email "exist@robotarmyma.de" and password "exist" and no address


Scenario: I sign in without an address set - i am asked to fill it out
Given I sign in as "exist@robotarmyma.de" with "exist"
Then I should see "a place and your name"
When I fill in "address[zipcode]" with "94102"
When I fill in "address[name]" with "Curtis Schofield"
And I press "Set It!"
Then I should see "Create Log"


