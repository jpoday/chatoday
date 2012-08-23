Given /^the room exists$/ do
  @room = FactoryGirl.create(:room)
  @room.start(output)
end

Given /^I'm in the room$/ do
  FactoryGirl.create(:room_user, :user => @user, :room => @room)
end

Given /^he's in the room$/ do
  FactoryGirl.create(:room_user, :user => @user2, :room => @room)
end

When /^I enter a room$/ do
  @room.enter(@user)
end

When /^I leave the room$/ do
  @room.leave(@user)
end

Then /^the room should display "(.*?)"$/ do |message|
  output.messages.should include(message)
end

Then /^I should be in the room$/ do
  @room_user = RoomUser.find_by_user_id(@user)
  @room_user.should be_valid
end

Then /^I should not be in the room$/ do
  @room_user = RoomUser.find_by_user_id(@user)
  @room_user.should be_nil
end