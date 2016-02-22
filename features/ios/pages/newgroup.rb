require 'calabash-cucumber/ibase'

class NewGroupPage < Calabash::IBase

  def trait
    "UILabel text:'New Group'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def setName(name)
    sleep(3)
    keyboard_enter_text name
  end

  def proceed()
    touch("UINavigationButton marked:'Create'")
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
