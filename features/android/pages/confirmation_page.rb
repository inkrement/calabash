require 'calabash-android/abase'

class ConfirmationPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'Your code'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def select_confirmation_code(confirmation_code)
    enter_text("android.widget.EditText", confirmation_code)
  end

  def submit_confirmation_form()
    touch("org.telegram.ui.ActionBar.ActionBarMenuItem index:0")

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
    "android.widget.EditText"
  end
end
