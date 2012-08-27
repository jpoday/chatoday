When /^"(.*?)" comments, "(.*?)"( at "(#{CAPTURE_TIME})")?$/ do |name, content, time_present, time|
  user = User.find_by_name(name)
  user.comments.create(:room => @room, :content => content)
end

Then /^"(.*?)"'s comment should exist$/  do |name|
  user = User.find_by_name(name)
  Comment.where("user_id = ? AND room_id = ? AND content = ?",user.id, @room.id, "Hey!").first.should be_valid
end