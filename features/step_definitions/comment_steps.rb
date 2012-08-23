When /^I say "(.*?)"$/ do |content|
  @user1.comments.create(:room => @room, :content => content)
end

Then /^the comment should exist$/ do
  @comment = ChatODay::Comment.where("user_id = ? AND room_id = ? AND content = ?",@user1.id, @room.id, "Hey!")
end