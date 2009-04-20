require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    self.title = "Example"
    self.icon = "ball.bmp"
    self.fill = Color.white
  end
end

Example.new.run