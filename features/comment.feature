Feature: Comment in the chat room

	As a user
	I want to be able to make comments
	So I can talk to people
	
	Scenario: comment
		Given the room exists
		And there is a user named "Joe"
		And "Joe" is in the room
		When "Joe" comments, "Hey!"
		Then "Joe"'s comment should exist
		And the room should display "Joe comments: "Hey!""
		And it should add "Joe"'s "comment" to chat history
		
		
	