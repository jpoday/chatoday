Given /^there is a user named "(.*?)"$/ do |name|
  FactoryGirl.create(:user, :name => name)
end