require 'calabash-cucumber/ibase'

class GroupChatPage < Calabash::IBase

  def trait
    "UILabel {text BEGINSWITH '2 members'}"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
