Feature: Enter and exit a chat room

	As a user
	I want to be able to enter and exit a chat room
	So that I can chat and leave when I want
	
	Scenario: enter-the-room
		Given I'm a user named "Joe"
		And the room exists
		When I enter a room
		Then the room should display "Joe enters the room"
		And I should be in the room
	
	@wip
	Scenario: leave-the-room
		Given the room exists
		And I'm a user named "Joe"
		And I'm in the room
		When I leave the room
		Then the room should display "Joe leaves"
		And I should not be in the room