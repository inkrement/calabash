require 'calabash-android/abase'

class NewGroupMemberSelectionPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'New Group'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def searchAndSelectFirst(name)
    ## enter name
    enter_text("android.widget.EditText",name)
    ## select first
    touch(query("org.telegram.ui.Cells.UserCell")[0])
    ## proceed
    touch("org.telegram.ui.ActionBar.ActionBarMenuItem")
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
