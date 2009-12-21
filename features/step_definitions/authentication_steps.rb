Then /^I should see the log in form$/ do
  response.should contain('Login')
  response.should contain('Password')
end

Given /^I am "([^\"]*)" with a password "([^\"]*)"$/ do |login, password|
  Factory.create(:user, :login => login, :password => password)
end

Then /^I should be logged in$/ do
  response.should contain('Logged in successfully!')
end
