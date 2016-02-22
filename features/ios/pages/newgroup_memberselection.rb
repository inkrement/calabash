require 'calabash-cucumber/ibase'

class NewGroupMemberSelectionPage < Calabash::IBase

  def trait
    "UILabel text:'New Group'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def searchAndSelectFirst(name)
    ## touch
    touch("* {text BEGINSWITH 'Who would'}")
    ## enter name
    keyboard_enter_text name
    ## select first
    touch("TGContactCell index:0")
    ## proceed
    touch("UINavigationButton marked:'Next'")
    ## await new page
    wait_for_newgroupwindow()
  end

  def wait_for_newgroupwindow
    result = :invalid
    ng_page = page(NewGroupPage)

    wait_for(timeout: 60) do
      if element_exists(ng_page.trait)
        result = :valid
      end
    end

    case result
      when :invalid
        self
      else
        ng_page.await(timeout:10)
    end
  end
end
