require 'calabash-android/abase'

class MainPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'Telegram'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
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


  def new_message_button
    "android.widget.ImageView index:2"
  end
end
