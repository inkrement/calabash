require 'calabash-android/abase'

class MainPage < Calabash::ABase

  def trait
    "android.widget.TextView text:'Telegram'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
