require 'calabash-android/abase'

class GroupChatPage < Calabash::ABase

  def trait
    "android.widget.TextView {text CONTAINS[c] 'members'}"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
