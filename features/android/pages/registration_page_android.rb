require 'calabash-android/abase'

class RegistrationPage < Calabash::ABase

  def trait
    "* text:'Your phone'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end


  def select_countrycode(country_code)
    # click on country selection
    touch(country_dropdown)

    # scroll until right country code is found
    q = query(country_label(country_code))
    while q.empty?
      scroll_down
      q = query(country_label(country_code))
    end

    touch(q)
  end

  def submit_registration_form()
    tap_when_element_exists("ActionBarMenuItem")
  end

  def select_phonenumber(phone_number)
    enter_text(phone_input, phonenumber)
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
