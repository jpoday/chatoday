Feature: Enter a chat room

	As a user
	I want to be able to enter a chat room
	So that I can chat
	
	Scenario: enter-the-room
		Given I'm a user
		And the room exists
		When I enter a room
		Then I should see "enters the room"