Feature: Registration
  As an anonymous user
  I want to be able to register
  So that I can access the application


  Scenario: Display registration form to an anonymous user
    Given I am an anonymous user
    When I go to the registration page
    Then I should see the registration form
