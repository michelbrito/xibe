require 'xibe'
include Xibe

class Exemplo < Application
  def initialize
    super(320,240)
    @text = TextBlitter.new("font.bmp")
    @text.color = Color.blue
    @text.text = "Hello world!"
    @text.x = 100
    @text.y = 10
    add @text
  end
end

Exemplo.new.run