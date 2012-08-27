Feature: Enter and exit a chat room

	As a user
	I want to be able to enter and exit a chat room
	So that I can chat and leave when I want

	Scenario: enter-the-room
	 	Given the room exists
		And there is a user named "Joe"
		When "Joe" enters the room
		Then the room should display "Joe enters the room"
		And "Joe" should be in the room
		And it should add "Joe"'s "entrance" to chat history
	

	Scenario: leave-the-room
		Given the room exists
		And there is a user named "Joe"
		And "Joe" is in the room
		When "Joe" leaves the room
		Then the room should display "Joe leaves"
		And "Joe" should not be in the room
		And it should add "Joe"'s "exit" to chat history