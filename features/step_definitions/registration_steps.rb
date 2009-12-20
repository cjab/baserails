Given /^I am an anonymous user$/ do
end

Then /^I should see the registration form$/ do
  response.should contain('Login')
  response.should contain('Email')
  response.should contain('Password')
  response.should contain('Password confirmation')
end

Then /^I should have registered successfully$/ do
  When 'I should see "Registration successful"'
end

Then /^I should have failed to register$/ do
  When 'I should see "Registration failed"'
end
