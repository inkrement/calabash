require 'calabash-cucumber/ibase'

class ChatPage < Calabash::IBase

  def trait
    "* {text BEGINSWITH 'last seen'}"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def composeMessage(text)
    enter_text(compose_message_field, "")
    keyboard_enter_text text
  end

  def submitMessage()
    touch(submit_button)
  end


  def compose_message_field
    "HPGrowingTextView"
  end

  def submit_button
    "UIButtonLabel marked:'Send'"
  end

end
