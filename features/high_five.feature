Feature: High-five another user
	
	As a user
	I want to be able to high five other users
	So they know that I think they're cool

	Scenario: high-five-another-user
		Given the room exists
		And there is a user named "Joe"
		And "Joe" is in the room
		And there is a user named "Dan"
		And "Dan" is in the room
		When "Joe" high-fives "Dan"
		Then "Joe"'s high-five to "Dan" should exist
		And the room should display "Joe high-fives Dan"
		And it should add "Joe"'s high-five to "Dan" to chat history
		