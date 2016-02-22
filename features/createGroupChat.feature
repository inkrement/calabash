Feature: Create Group Chat

  Scenario: create group chat
    Given a main page
    Then I click compose new message
    Then I click to create new group chat
    Then I search and select "Francesca"
    Then I enter group name "some group" and proceed
    Then I should see a GroupChatPage
