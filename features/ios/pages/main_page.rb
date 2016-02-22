require 'calabash-cucumber/ibase'

class MainPage < Calabash::IBase

  def trait
    "UILabel text:'Chats'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def containsMessage(message)
    sleep(3)

    if element_exists("TGDialogListTextView text:'test#!+'")
      return true
    else
      return false
    end
  end

  def new_message()

    touch(new_message_button)

    wait_for_nmc_done
  end

  def wait_for_nmc_done
    result = :invalid
    nm_page = page(NewMessagePage)

    wait_for(timeout: 60) do
      if element_exists(nm_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        nm_page.await(timeout:10)
    end
  end


  '''
    name: Compose
    type: UIAButton
    value:
    label: Compose
    xpath: //UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAButton[3]
  '''
  def new_message_button
    "UINavigationButton marked:'Compose'"
  end
end
