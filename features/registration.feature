Feature: Registration
  As an anonymous user
  I want to be able to register
  So that I can access the application


  Scenario: Display registration form to an anonymous user
    Given I am an anonymous user
    When I go to the registration page
    Then I should see the registration form

  Scenario: Anonymous user registers
    Given I am an anonymous user
    When I go to the registration page
    And fill in "Login" with "holden"
    And fill in "Email" with "holden@dinocore.net"
    And fill in "Password" with "crocodile"
    And fill in "Password confirmation" with "crocodile"
    And press "Register"
    Then I should have registered successfully
