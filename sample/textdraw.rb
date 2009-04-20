require 'xibe'
include Xibe

class Exemplo < Application
  def initialize
    super(320,240)
    @text = Text.new("arial.ttf",16)
    @text.color = Color.red
    @text.text = "Hello world!"
    @text.style(:bold => true, :italic => false, :underline => false)
    add @text
  end
end

Exemplo.new.run