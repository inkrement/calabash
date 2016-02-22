Feature: Send and Receive

  Scenario: send message
    Given a main page
    Then I click compose new message
    Then I search for "Dominik Pichler" and select first
    Then I compose message "test123"
    Then I submit message
    Then I wait for receipt of the message "test123"

#  Scenario: receive message
#    Given a main page
#    Then the message "123ha" is sent to me
#    Then I receive the message


Scenario: create group chat
  Given a main page
  Then I click compose new message
  Then I click to create new group chat
  Then I search and select "Francesca"
  Then I enter group name "some group" and proceed
  Then I should see a GroupChatPage
