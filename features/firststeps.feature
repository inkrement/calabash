Feature: First Steps

  @reinstall
  Scenario: Skip welcome message
    Given a welcome message
    When I skip the welcome message
    Then I am taking to the registration screen

  @reinstall
  Scenario: registration
    Given a welcome message
    When I skip the welcome message
    Then I am taking to the registration screen
    Then I select country with code "+43"
    Then I select phone number "69911602033"
    When I submit registration form
    Then I am taking to the confirmation screen
    Then I enter confirmation code
    Then I submit confirmation form
    Then I am taking to the main screen
