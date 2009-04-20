require 'xibe'
include Xibe

SCREEN_WIDTH = 320
SCREEN_HEIGHT = 240

class SceneIntro < Scene
  def initialize
    super(SCREEN_WIDTH,SCREEN_HEIGHT)
    @text = Text.new("arial.ttf",16)
    @text.text = "Press any key to continue..."
    @text.color = Color.white
    @text.x = (@width - @text.text_width)/2
    @text.y = (@height - @text.text_height)/2
    add @text
  end

  def input(e)
    if e.type == KEYDOWN
      @demo = SceneDemo.new
      @demo.show
    end
  end
end

class SceneDemo < Scene
  def initialize
    super(SCREEN_WIDTH,SCREEN_HEIGHT)
    self.fill = Color.white
    @ball = Sprite.new("ball.bmp",32,32,true)
    add @ball
  end

  def update
    if Key.press? K_RIGHT
      @ball.x += 5
    end
    if Key.press? K_LEFT
      @ball.x -= 5
    end
    if Key.press? K_DOWN
      @ball.y += 5
    end
    if Key.press? K_UP
      @ball.y -= 5
    end
  end
end

class Example < Application
  def initialize
    super(SCREEN_WIDTH,SCREEN_HEIGHT)
    @intro = SceneIntro.new
    @intro.show
  end
end

Example.new.run