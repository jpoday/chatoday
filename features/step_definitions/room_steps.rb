Given /^the room exists$/ do
  @room = ChatODay::Room.create(:name => "NationBuilder Tech Test")
  @room.start(output)
end

Given /^I'm in the room$/ do
  ChatODay::RoomUser.create(:user => @user1, :room => @room)
end

When /^I enter a room$/ do
  @room.enter(@user1)
end

When /^I leave the room$/ do
  @room.leave(@user1)
end

Then /^the room should display "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Then /^I should be in the room$/ do
  @room_user = ChatODay::RoomUser.find_by_user_id(@user1)
  @room_user.should be_valid
end

Then /^I should not be in the room$/ do
  @room_user = ChatODay::RoomUser.find_by_user_id(@user1)
  @room_user.should be_nil
end