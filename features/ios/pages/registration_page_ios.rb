require 'calabash-cucumber/ibase'


class RegistrationPage < Calabash::IBase

  def trait
    "* text:'Your Phone'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end

end
