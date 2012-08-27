Then /^it should add "(.*?)"'s "(.*?)" to chat history$/ do |name, event|
  user = User.find_by_name(name)
  user.send(event.pluralize.to_sym).first.should be_valid
end

Then /^it should add "(.*?)"'s high\-five to "(.*?)" to chat history$/ do |subject, receiver|
  user = User.find_by_name(subject)
  other_user = User.find_by_name(receiver)
  Interaction.where("subject_id = ? AND verb = \"high-five\" AND receiver_id = ? AND room_id = ?",
                     user.id, other_user.id, @room.id).first.history.should be_valid
end