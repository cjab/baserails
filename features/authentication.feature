Feature: Authentication
  As a registered user
  I want to be able authenticate
  So that I can access the application

  Scenario: Display log in form to an anonymous user
    Given I am an anonymous user
    When I go to the log in page
    Then I should see the log in form
