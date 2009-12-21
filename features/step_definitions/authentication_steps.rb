Then /^I should see the log in form$/ do
  response.should contain('Login')
  response.should contain('Password')
end
