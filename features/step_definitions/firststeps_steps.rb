
##
## Skip Welcome Message
##

Given(/^a welcome message$/) do
  @current_page = page(WelcomePage).await(timeout: 30)
end

When(/^I skip the welcome message$/) do
  @current_page = @current_page.skip_message()
end

Then(/^I am taking to the registration screen$/) do
  unless @current_page.is_a?(RegistrationPage)
    raise "Expected RegistrationPage, but found #{@current_page}"
  end
end


##
## Registration
##

Then(/^I select country with code "([^"]*)"$/) do |countrycode|
  @current_page.select_countrycode(countrycode)
end

Then(/^I select phone number "([^"]*)"$/) do |phone_number|
  @current_page.select_phonenumber(phone_number)
end

When(/^I submit registration form$/) do
  @current_page = @current_page.submit_registration_form()
end


##
## Confirmation
##

Then(/^I am taking to the confirmation screen$/) do
  unless @current_page.is_a?(ConfirmationPage)
    raise "Expected ConfirmationPage, but found #{@current_page}"
  end
end

Then(/^I enter confirmation code$/) do
  confirmation_code = `~/Documents/dipl/cucumber/scripts/get_confirmation_code.sh`

  print "confirmation code: #{confirmation_code}"

  @current_page.select_confirmation_code(confirmation_code)
end

Then(/^I submit confirmation form$/) do
  @current_page = @current_page.submit_confirmation_form()
end

Then(/^I am taking to the main screen$/) do
  unless @current_page.is_a?(MainPage)
    raise "Expected MainPage, but found #{@current_page}"
  end
end
