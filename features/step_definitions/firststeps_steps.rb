

Given(/^a welcome message$/) do
  @current_page = page(WelcomePage).await(timeout: 30)
end

When(/^I skip the welcome message$/) do
  @current_page = @current_page.skip_message()
end

Then(/^I am taking to the information screen$/) do
  unless @current_page.is_a?(RegistrationPage)
    raise "Expected RegistrationPage, but found #{@current_page}"
  end
end
