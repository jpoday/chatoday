Feature: High-five another user
	
	As a user
	I want to be able to high five other users
	So they know that I think they're cool

	Scenario: high-five-another-user
		Given the room exists
		And I'm a user named "Joe"
		And I'm in the room
		And there's another user named "Dan"
		And he's in the room
		When I high five "Dan"
		Then the "high-five" action should exist
		And the room should display "Joe high-fives Dan"
		And it should add the interaction to chat history
		