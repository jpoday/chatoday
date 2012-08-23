When /^I high five "(.*?)"$/ do |otheruser|
  @other_user = User.find_by_name(otheruser)
  @user.interacts("high-five",@other_user,@room)
end

Then /^the "(.*?)" action should exist$/ do |action|
  @interaction = Interaction.where("subject_id = ? AND verb = ? AND receiver_id = ? AND room_id = ?",
                                    @user.id, action, @other_user.id, @room.id).first
  @interaction.should be_valid
end