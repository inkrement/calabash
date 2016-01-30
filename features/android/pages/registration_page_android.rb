require 'calabash-android/abase'

class RegistrationPage < Calabash::ABase

  def trait
    "* text:'Your phone'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
