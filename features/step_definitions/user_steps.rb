Given /^I'm a user named "(.*?)"$/ do |name|
  @user = FactoryGirl.create(:user, :name => name)
end

Given /^there's another user named "(.*?)"$/ do |name|
  FactoryGirl.create(:user, :name => name)
end