Then /^I should see the log in form$/ do
  response.should contain('Login')
  response.should contain('Password')
end

Given /^I am "([^\"]*)" with a password "([^\"]*)"$/ do |login, password|
  @user = Factory.build(:user, :login => login, :password => password)
  if @user.valid? then @user.save end
end

Then /^I should be logged in$/ do
  response.should contain('Logged in successfully!')
end

Then /^I should not be logged in$/ do
  response.should contain('Failed to log in!')
end

Then /^I should be logged out$/ do
  response.should contain('Logged out successfully!')
end

Given /^I am logged in as "([^\"]*)" with password "([^\"]*)"$/ do |login, password|
  visit login_path
  Given "I am \"#{login}\" with a password \"#{password}\""
  Then "fill in \"Login\" with \"#{login}\""
  Then "fill in \"Password\" with \"#{password}\""
  Then "press \"Log in\""
end
