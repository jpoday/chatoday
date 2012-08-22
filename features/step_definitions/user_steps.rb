Given /^I'm a user$/ do
  @user1 ||= ChatODay::User.new('Joe')
end