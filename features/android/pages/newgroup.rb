require 'calabash-android/abase'

class NewGroupPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'New Group'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end


  def setName(name)
    enter_text("android.widget.EditText", name)
  end

  def proceed()
    touch("org.telegram.ui.ActionBar.ActionBarMenuItem")
    wait_groupchat
  end

  def wait_groupchat
    result = :invalid
    gc_page = page(GroupChatPage)

    wait_for(timeout: 60) do
      if element_exists(gc_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        gc_page.await(timeout:10)
    end
  end
end
