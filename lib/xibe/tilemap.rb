# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  class Tilemap < Layer
    def initialize(tiles, obstacle = false)
      super()
      @tiles = tiles
      @obstacle = obstacle
      @box = []
    end

    def load_map(map, width, height)
      @map = map
      @width = width
      @height = height
      if @obstacle == true
        for i in 0..@height - 1
          for j in 0..@width - 1
            @box << {:map => @tiles[@map[i][j]].make_collision_map, :x => j*@tiles[@map[i][j]].w, :y => i*@tiles[@map[i][j]].h}
          end
        end
      end
    end

    def cmap
      @box
    end

    def draw
      if @visible == true
        for i in 0..@height -1
          for j in 0..@width - 1
            draw_tile(@tiles[@map[i][j]], j*@tiles[@map[i][j]].w+@x, i*@tiles[@map[i][j]].h+@y)
          end
        end
      end
    end

    private
    #Draw tile
    def draw_tile(image, x, y)
      SDL::Surface.blit(image, 0, 0, image.w, image.h, SDL.get_video_surface, x -$application.scene.camera.x, y - $application.scene.camera.y)
    end
  end
end
