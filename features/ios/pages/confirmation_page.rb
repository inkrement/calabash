require 'calabash-cucumber/ibase'


class ConfirmationPage < Calabash::IBase

  def trait
    "UILabel text:'+43 699 11602033'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def select_confirmation_code(confirmation_code)
    wait_for_keyboard

    set_text confirmation_code_input, confirmation_code
  end

  def submit_confirmation_form()
    touch("* marked:'Next'")

    wait_for_confirmation_done
  end

  def wait_for_confirmation_done
    result = :invalid
    main_page = page(MainPage)

    wait_for(timeout: 60) do
      if element_exists(main_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        main_page.await(timeout:10)
    end
  end

  def confirmation_code_input
    "TGTextField"
  end
end
