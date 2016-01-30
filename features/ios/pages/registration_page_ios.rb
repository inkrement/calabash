require 'calabash-cucumber/ibase'


class RegistrationPage < Calabash::IBase

  def trait
    "* text:'Your Phone'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end


  def select_countrycode(country_code)
    # click on country selection

    if element_does_not_exist("* text:'Austria'")
      touch(country_dropdown)

      sleep 1

      # scroll until right country code is found
      q = query(country_label(country_code))
      while q.empty?
        scroll("TGListsTableView", 'down')

        #hack: wait
        sleep 1
        q = query(country_label(country_code))
      end

      touch(q)
    end

  end

  def select_phonenumber(phone_number)
    enter_text phone_input, phone_number
  end

  def submit_registration_form()
    touch("* marked:'Next'")

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


  def country_dropdown
    #the following works only for new installation with wright localisation: "* marked:'USA'"
    "UIButtonLabel index:0"
  end

  def phone_input
    "*"
  end

  def country_label(country_code)
    "UILabel text:'#{country_code}'"
  end
end
