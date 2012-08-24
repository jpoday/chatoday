Then /^it should add my "(.*?)" to chat history$/ do |user_event|
  @user.send(user_event.pluralize.to_sym).first.should be_valid
end

Then /^it should add the comment to chat history$/ do
  @comment.history.should be_valid
end

Then /^it should add the interaction to chat history$/ do
  @interaction.history.should be_valid
end