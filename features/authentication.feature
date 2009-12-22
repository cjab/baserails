Feature: Authentication
  As a registered user
  I want to be able authenticate
  So that I can access the application

  Scenario: Display log in form to an anonymous user
    Given I am an anonymous user
    When I go to the log in page
    Then I should see the log in form

  Scenario: Allow user with valid credentials to log in
    Given I am "holden" with a password "crocodile"
    When I go to the log in page
    And fill in "Login" with "holden"
    And fill in "Password" with "crocodile"
    And I press "Log in"
    Then I should be logged in

  Scenario Outline: Do not allow a user with invalid credentials to log in
    Given I am "holden" with a password "crocodile"
    When I go to the log in page
    And fill in "Login" with "<login>"
    And fill in "Password" with "<password>"
    And I press "Log in"
    Then I should not be logged in

  Examples:
    | login  | password  |
    | holden |           |
    |        | crocodile |
    |        |           |
    | holden | alligator |
    |        | alligator |
    | pheobe | alligator |
    | pheobe |           |

  Scenario: Allow a logged in user to log out
    Given I am logged in as "holden" with password "crocodile"
    When I go to the log out page
    Then I should be on the log in page
    And I should be logged out
