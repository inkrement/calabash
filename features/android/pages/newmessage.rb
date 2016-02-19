require 'calabash-android/abase'

class NewMessagePage < Calabash::ABase

  def trait
    "android.widget.TextView text:'New Message'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def createNewGroupChat()
    touch("android.widget.TextView text:'New Group'")

    wait_for_ng_ms_window
  end

  def searchAndSelectFirst(name)
    ## search for contact using name
    touch(search_icon)
    enter_text("EditText", name)

    ## select first match
    touch('org.telegram.ui.Cells.ProfileSearchCell index:0')

    wait_for_chatwindow()
  end

  def wait_for_chatwindow
    result = :invalid
    chat_page = page(ChatPage)

    wait_for(timeout: 60) do
      if element_exists(chat_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        chat_page.await(timeout:10)
    end
  end

  def wait_for_ng_ms_window
    result = :invalid
    ng_ms_page = page(NewGroupMemberSelectionPage)

    wait_for(timeout: 60) do
      if element_exists(ng_ms_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        ng_ms_page.await(timeout:10)
    end
  end

  def search_icon
    "android.widget.ImageView index:0"
  end
end
