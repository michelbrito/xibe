require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    @image = Image.new("ball.bmp",true)
    @clone = @image.clone
    @clone.x = 100
    @clone.y = 100
    add @image, @clone
  end
end

Example.new.run