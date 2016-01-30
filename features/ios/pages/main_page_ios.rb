require 'calabash-cucumber/ibase'


class MainPage < Calabash::IBase

  def trait
    "UILabel text:'Chats'"
  end

  def await(opts={})
    wait_for_elements_exist([trait])
    self
  end
end
