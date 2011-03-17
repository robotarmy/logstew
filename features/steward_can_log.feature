Feature: I can sign in and make a new log 

Background:
Given I am signed out

Scenario: I'm a new steward interested in logging
Given I am on the root page
Then I should see "You can join and start"
When I fill in "steward[email]" with "newlogstew@robotarmyma.de" within "#sign_up"
When I fill in "steward[password]" with "newlog" within "#sign_up"
When I fill in "steward[password_confirmation]" with "newlog" within "#sign_up"
And I press "save"
Then I should see "public name"
Then I should see "private Zip Code?"
Then I should see "your location?"

Scenario: I'm an existing steward 
Given I am a steward with email "exist@robotarmyma.de" and password "exist"
Given I sign in as "exist@robotarmyma.de" with "exist"
Then I should see "new journal entry"
When I follow "new journal entry"
Then I should see "NEW"
When I fill in "log[story]" with "this is my story" 
When I fill in "log[title]" with "I have a nice title" 
And I press "save"
Then I should see "this is my story"
