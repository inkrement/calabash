
##
## Send Message
##

Given(/^a main page$/) do
  start_test_server_in_background()
  @current_page = page(MainPage).await(timeout: 30)
end

Then(/^I click compose new message$/) do
  unless @current_page.is_a?(MainPage)
    raise "Expected MainPage, but found #{@current_page}"
  end

  @current_page = @current_page.new_message()
end

Then(/^I search for "([^"]*)" and select first$/) do |name|
  unless @current_page.is_a?(NewMessagePage)
    raise "Expected NewMessagePage, but found #{@current_page}"
  end

  @current_page = @current_page.searchAndSelectFirst(name)
end

Then(/^I compose message "([^"]*)"$/) do |msg|
  @current_page.composeMessage(msg)
end

Then(/^I submit message$/) do
  @current_page.submitMessage()
end

Then(/^I wait for receipt of the message "([^"]*)"$/) do |msg|
  message_raw = `~/Documents/dipl/impl/cucumber-calabash/scripts/get_last_message.sh`
  message =  message_raw.split.last

  unless message == msg
    raise "Expected Message is '#{msg}', but found '#{message}'"
  end
end

##
## Receive
##

Then(/^I should see the message "([^"]*)"$/) do |message|
  unless @current_page.is_a?(MainPage)
    raise "Expected MainPage, but found #{@current_page}"
  end

  unless @current_page.containsMessage(message)
    raise "Not able to find Message: #{message}"
  end
end
