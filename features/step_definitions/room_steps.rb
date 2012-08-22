Given /^the room exists$/ do
  @room ||= ChatODay::Room.new(output)
end

When /^I enter a room$/ do
  @room.enter(@user)
end