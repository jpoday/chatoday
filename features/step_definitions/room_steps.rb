Given /^the room exists$/ do
  @room = FactoryGirl.create(:room)
  @room.start(output)
end

Given /^"(.*?)" is in the room$/ do |name|
  user = User.find_by_name(name)
  FactoryGirl.create(:room_user, :user => user, :room => @room)
end

When /^"(.*?)" enters the room( at "(#{CAPTURE_TIME})")?$/ do |name, time_present, time|
  @room.enter(User.find_by_name(name))
end

When /^"(.*?)" leaves the room( at "(#{CAPTURE_TIME})")?$/ do |name, time_present, time|
  user = User.find_by_name(name)
  @room.leave(user)
end

When /^an "(.*?)" summary is requested$/ do |granularity|
  @room.start(hourly_output)
  @room.summary(granularity)
end

Then /^"(.*?)" should( not)? be in the room$/ do |name, negate|
  user = User.find_by_name(name)
  present = RoomUser.find_by_user_id(user)
  negate ? (present.should be_nil) : (present.should be_valid)
end

# Individual message
Then /^the room should display "(.*?)"$/ do |message|
  output.messages.grep /#{message}/
end

# Block message
Then /^the room should show$/ do |string|
  string.split("\n").each_with_index do |message,i|
    output.messages[i].should == "#{message}"
  end
end