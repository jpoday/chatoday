When /^"(.*?)" high\-fives "(.*?)"( at "(#{CAPTURE_TIME})")?$/ do |subject, receiver, time_present, time|
  user = User.find_by_name(subject)
  other_user = User.find_by_name(receiver)
  user.interacts("high-five",other_user,@room)
end

Then /^"(.*?)"'s high-five to "(.*?)" should exist$/  do |subject, receiver|
  user = User.find_by_name(subject)
  other_user = User.find_by_name(receiver)
  Interaction.where("subject_id = ? AND verb = \"high-five\" AND receiver_id = ? AND room_id = ?",
                     user.id, other_user.id, @room.id).first.should be_valid
end