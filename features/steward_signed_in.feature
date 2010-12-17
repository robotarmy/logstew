Feature: If I have a session my experience revolves around the log

Background:
Given I am signed out
Given I am a steward with email "exist@robotarmyma.de" and password "exist"
Given I sign in as "exist@robotarmyma.de" with "exist"

Scenario: I visit "/"
Given I am on the welcome_index page
Then I should not see "You can join and start"
And I should see "stewardship journal"

Scenario: I visit "/stewards/sign_in"
Given I am on the new_steward_session page
Then I should not see "You can join and start"
And I should see "stewardship journal"

