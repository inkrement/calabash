require 'calabash-android/abase'

class ChatPage < Calabash::ABase

  def trait
    "android.widget.TextView {text CONTAINS[c] 'last seen'}"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

  def composeMessage(text)
    enter_text("ChatActivityEnterView", text)
  end

  def submitMessage()
    touch(query('android.widget.ImageView')[-1])
  end

end
