require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    self.fill = Color.white
    tiles = Image.to_tiles("ice.png", 32, 32, true, 0)

    @platform = Tilemap.new(tiles,true)
    map = [[0,1,2],[6,7,8],[6,7,8]]
    @platform.load_map(map, 3, 3)
    @platform.y = 144

    @platform2 = Tilemap.new(tiles,true)
    map2 = [[12,13,14,12,13,14,12,13,14],[18,19,20,18,19,20,18,19,20]]
    @platform2.load_map(map2, 9, 2)
    @platform2.y = 176
    @platform2.x = 96

    add @platform, @platform2
  end
end

Example.new.run