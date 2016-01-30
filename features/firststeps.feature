Feature: First Steps

  Scenario: Skip welcome message
    Given a welcome message
    Then take picture
    When I skip the welcome message
    Then I am taking to the information screen
    Then take picture

  #Scenario: registration
  #  Given a submitted registration form with correct information
  #  Then I should see a code request
  #  Then I enter the correct registration code
  #  # this is the sender-name of the last message received (reg-code)
  #  Then I should see "Start Messaging"
