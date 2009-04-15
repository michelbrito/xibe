require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    @image = Image.new("ball.bmp",true)
    add @image
  end
end

Example.new.run