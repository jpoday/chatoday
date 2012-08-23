When /^I say "(.*?)"$/ do |content|
  @user.comments.create(:room => @room, :content => content)
end

Then /^the comment should exist$/ do
  @comment = Comment.where("user_id = ? AND room_id = ? AND content = ?",@user.id, @room.id, "Hey!").first
  @comment.should be_valid
end