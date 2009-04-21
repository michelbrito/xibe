require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    self.fill = Color.white
    @ball = Sprite.new("ball.bmp",32,32,true)
    @ball.pos(32,32)
    tiles = Image.to_tiles("tileset.bmp", 16, 16, true, 0)
    @wall = Tilemap.new(tiles,true)
    map = [[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      [0,1,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,5,2,0],
      [0,5,0,0,0,0,0,0,0,0,5,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,9,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,1,5,5,2,0,0,0,0,0,0,1,2,0,0,5,0],
      [0,5,0,0,6,5,5,7,0,0,0,0,0,0,6,7,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,0],
      [0,5,0,0,1,5,5,2,0,0,0,0,0,1,5,2,0,0,5,0],
      [0,5,0,0,5,0,0,5,0,0,0,0,0,5,0,5,0,0,5,0],
      [0,6,5,5,7,0,0,6,5,5,5,5,5,7,0,6,5,5,7,0],
      [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]
    @wall.load_map(map, 20, 15)
    add @wall, @ball
  end

  def update
    if Key.press? K_RIGHT
      @ball.x += 8
      while(@ball.collide_with_tilemap?true)
        @ball.x -= 1
      end
    end
    if Key.press? K_LEFT
      @ball.x -= 8
      while(@ball.collide_with_tilemap?true)
        @ball.x += 1
      end
    end
    if Key.press? K_DOWN
      @ball.y += 8
      while(@ball.collide_with_tilemap?true)
        @ball.y -= 1
      end
    end
    if Key.press? K_UP
      @ball.y -= 8
      while(@ball.collide_with_tilemap?true)
        @ball.y += 1
      end
    end
  end
end

Example.new.run