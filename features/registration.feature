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

  Scenario Outline: Anonymous user registration fails 
    Given I am an anonymous user
    When I go to the registration page
    And fill in "Login" with "<login>"
    And fill in "Email" with "<email>"
    And fill in "Password" with "<password>"
    And fill in "Password confirmation" with "<password_confirmation>"
    And press "Register"
    Then I should have failed to register

  Examples: Additional input needed
    | login  |       email         |  password |  password_confirmation  |
    |        |                     |           |                         |
    | holden |                     |           |                         |
    | holden | holden@dinocore.net |           |                         |
    | holden | holden@dinocore.net | crocodile |                         |

  Examples: Bad password combination
    | login  |       email         |  password |  password_confirmation  |
    | holden | holden@dinocore.net |           |                         |
    | holden | holden@dinocore.net | crocodile |                         |
    | holden | holden@dinocore.net |           |       crocodile         |
    | holden | holden@dinocore.net | crocodile |       alligator         |
