Feature: NationBuilder Tech Test
	
	As Joe O'Day
	I want to display the code I've created
	So my interview goes well and I get hired ;)
	
	Scenario: Minute-by-Minute chat granularity
		Given the room exists
		And there is a user named "Bob"
		And there is a user named "Kate"
		When "Bob" enters the room at "5:00pm"
		And "Kate" enters the room at "5:05pm"
		And "Bob" comments, "Hey, Kate - high five?" at "5:15pm"
		And "Kate" high-fives "Bob" at "5:17pm"
		And "Bob" leaves the room at "5:18pm"
		And "Kate" comments, "Oh, typical" at "5:20pm"
		And "Kate" leaves the room at "5:21pm"
		Then the room should show
			"""
			5:00pm: Bob enters the room
			5:05pm: Kate enters the room
			5:15pm: Bob comments: "Hey, Kate - high five?"
			5:17pm: Kate high-fives Bob
			5:18pm: Bob leaves
			5:20pm: Kate comments: "Oh, typical"
			5:21pm: Kate leaves
			"""
			
	Scenario: Hourly chat granularity
		Given the room exists
		And there is a user named "Bob"
		And there is a user named "Kate"
		And there is a user named "Captain"
		And there is a user named "Mechanic"
		And there is a user named "Cats"
		# First Hour
		When "Bob" enters the room at "5:00pm"
		And "Kate" enters the room at "5:05pm"
		And "Bob" comments, "Hey, Kate - high five?" at "5:15pm"
		And "Kate" high-fives "Bob" at "5:17pm"
		And "Bob" leaves the room at "5:18pm"
		And "Kate" comments, "Oh, typical" at "5:20pm"
		And "Kate" leaves the room at "5:21pm"
		# Second Hour
		And "Kate" enters the room at "6:00pm"
		And "Captain" enters the room at "6:01pm"
		And "Mechanic" enters the room at "6:05pm"
		And "Cats" enters the room at "6:06pm"
		And "Captain" comments, "What" at "6:14pm"
		And "Captain" comments, "Happen" at "6:14pm"
		And "Mechanic" comments, "Somebody" at "6:16pm"
		And "Mechanic" comments, "Set" at "6:16pm"
		And "Mechanic" comments, "Up" at "6:16pm"
		And "Mechanic" comments, "Us" at "6:16pm"
		And "Mechanic" comments, "The" at "6:16pm"
		And "Mechanic" comments, "Bomb" at "6:16pm"
		And "Cats" comments, "All" at "6:17pm"
		And "Cats" comments, "Your" at "6:17pm"
		And "Cats" comments, "Base" at "6:17pm"
		And "Cats" comments, "Are" at "6:17pm"
		And "Cats" comments, "Belong" at "6:17pm"
		And "Cats" comments, "To" at "6:17pm"
		And "Cats" comments, "Us" at "6:17pm"
		And "Cats" high-fives "Captain" at "6:18pm"
		And "Cats" high-fives "Mechanic" at "6:19pm"
		And "Cats" high-fives "Kate" at "6:20pm"
		And an "hourly" summary is requested
		Then the room should show
			"""
			5pm:
				2 people entered
				2 left
				1 person high-fived 1 other person
				2 comments
			6pm:
				4 people entered
				1 person high-fived 3 other people
				15 comments
			"""