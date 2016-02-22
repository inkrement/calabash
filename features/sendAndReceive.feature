Feature: Send and Receive

  ##precondition: send message with unique content e.g. "test#!+" to the test device
  Scenario: receive message
    Given a main page
    Then I should see the message "test#!+"

  Scenario: send message
    Given a main page
    Then I click compose new message
    Then I search for "Francesca Schmidt" and select first
    Then I compose message "test123"
    Then I submit message
    Then I wait for receipt of the message "test123"
