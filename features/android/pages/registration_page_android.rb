require 'calabash-android/abase'

class RegistrationPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'Your phone'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end


  def select_countrycode(country_code)
    # click on country selection
    touch(country_dropdown)

    sleep 1

    # scroll until right country code is found
    q = query(country_label(country_code))
    while q.empty?
      scroll_down

      sleep 1
      q = query(country_label(country_code))
    end

    touch(q)
  end

  def submit_registration_form()
    print "submit registration form"
    tap_when_element_exists("org.telegram.ui.ActionBar.ActionBarMenuItem index:0")

    wait_for_registration_done
  end

  def wait_for_registration_done
    result = :invalid
    confirmation_page = page(ConfirmationPage)

    wait_for(timeout: 60) do
      if element_exists(confirmation_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        confirmation_page.await(timeout:10)
    end
  end

  def select_phonenumber(phone_number)
    enter_text(phone_input, phone_number)
  end

  def phone_input
    "org.telegram.ui.Components.HintEditText"
  end

  def country_dropdown
    "android.widget.TextView index:1"
  end

  def country_label(country_code)
    "android.widget.TextView text:'#{country_code}'"
  end
end
