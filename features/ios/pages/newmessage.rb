require 'calabash-cucumber/ibase'

class NewMessagePage < Calabash::IBase

  def trait
    "UILabel text:'New Message'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def createNewGroupChat()
    touch(new_group_button)

    wait_for_ng_ms_window
  end

  def searchAndSelectFirst(name)
    touch(search_icon)

    ## search for contact using name
    enter_text(search_field, name)

    ## select first match
    touch(first_match)

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

  '''
    name: New Group
    type: UIAStaticText
    value: New Group
    label: New Group
    xpath: //UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIAScrollView[1]/UIATableCell[1]/UIAStaticText[1]
  '''
  def new_group_button
    "UILabel marked:'New Group'"
  end

  '''
    name: Search for contacts or usernames
    type: UIAStaticText
    value: Search for contacts or usernames
    label: Search for contacts or usernames
    xpath: //UIAApplication[1]/UIAWindow[1]/UIATableView[1]/UIAStaticText[1]
  '''
  def search_icon
    "* marked:'Search for contacts or usernames'"
  end


  '''
    type: UIATextField
    xpath: //UIAApplication[1]/UIAWindow[1]/UIAScrollView[1]/UIATextField[1]/UIATextField[1]
  '''
  def search_field
    "UITextField"
  end

  '''
    type: UIATableCell
    xpath: //UIAApplication[1]/UIAWindow[1]/UIATableView[2]/UIAScrollView[1]/UIATableCell[1]
  '''
  def first_match
    'TGContactCell index:0'
  end

  '''
    name: Next
    type: UIAButton
    label: Next
    xpath: //UIAApplication[1]/UIAWindow[1]/UIANavigationBar[1]/UIAButton[3]
  '''
  def next_button
    "UIAButton marked:'Next'"
  end

end
