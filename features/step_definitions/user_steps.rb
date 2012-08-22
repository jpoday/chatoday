Given /^I'm a user named "(.*?)"$/ do |name|
  @user1 = ChatODay::User.create(:name => name)
end