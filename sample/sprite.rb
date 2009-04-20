require 'xibe'
include Xibe

class Player < Sprite
  def initialize
    super("nico.png",32,32,true)
    @delay = 150
    walk_down
  end

  def walk_right
    @frames = [6,7,8,7]
  end

  def walk_left
    @frames = [3,4,5,4]
  end

  def walk_down
    @frames = [0,1,2,1]
  end

  def walk_up
    @frames = [9,10,11,10]
  end
end

class Example < Application
  def initialize
    super(320,240)
    self.fill = Color.white
    @player = Player.new
    add @player
  end

  def update
    if Key.press? K_RIGHT
      @player.walk_right
      @player.x += 3
    end
    if Key.press? K_LEFT
      @player.walk_left
      @player.x -= 3
    end
    if Key.press? K_DOWN
      @player.walk_down
      @player.y += 3
    end
    if Key.press? K_UP
      @player.walk_up
      @player.y -= 3
    end
  end
end

Example.new.run