require 'calabash-cucumber/ibase'


class WelcomePage < Calabash::IBase

  def trait
    "* text:'Telegram'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def skip_message()
    touch(skip_button)
    wait_for_skip_done
  end

  def wait_for_skip_done
    result = :invalid
    registration_page = page(RegistrationPage)

    wait_for(timeout: 60) do
      if element_exists(registration_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        registration_page.await(timeout:10)
    end
  end


  def skip_button
    "button marked: 'Start Messaging'"
  end
end
