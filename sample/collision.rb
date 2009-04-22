require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    self.fill = Color.white
    @ball = Sprite.new("ball.bmp",32,32,true)
    @clone = @ball.clone
    @clone.pos(100,100)
    add @ball, @clone
  end

  def update
    if Key.press? K_RIGHT
      @ball.x += 5
      while(@ball.collide_box?(@clone))
        @ball.x -= 1
      end
    end
    if Key.press? K_LEFT
      @ball.x -= 5
      while(@ball.collide_box?(@clone))
        @ball.x += 1
      end
    end
    if Key.press? K_DOWN
      @ball.y += 5
      while(@ball.collide_box?(@clone))
        @ball.y -= 1
      end
    end
    if Key.press? K_UP
      @ball.y -= 5
      while(@ball.collide_box?(@clone))
        @ball.y += 1
      end
    end   
  end
end

Example.new.run