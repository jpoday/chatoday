Feature: Comment in the chat room

	As a user
	I want to be able to make comments
	So I can talk to people

	Scenario: comment
		Given the room exists
		And I'm a user named "Joe"
		And I'm in the room
		When I say "Hey!"
		Then the room should display "Joe comments: "Hey!""
		And the comment should exist
		
	