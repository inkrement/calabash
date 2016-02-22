##
## New Group Message
##

Then(/^I click to create new group chat$/) do
  unless @current_page.is_a?(NewMessagePage)
    raise "Expected NewMessagePage, but found #{@current_page}"
  end

  @current_page=@current_page.createNewGroupChat()
end

Then(/^I search and select "([^"]*)"$/) do |name|
  unless @current_page.is_a?(NewGroupMemberSelectionPage)
    raise "Expected NewGroupMemberSelectionPage, but found #{@current_page}"
  end

  @current_page = @current_page.searchAndSelectFirst(name)
end

Then(/^I enter group name "([^"]*)" and proceed$/) do |group_name|
  @current_page.setName(group_name)
  @current_page = @current_page.proceed()
end

Then(/^I should see a GroupChatPage$/) do
  unless @current_page.is_a?(GroupChatPage)
    raise "Expected GroupChatPage, but found #{@current_page}"
  end
end
