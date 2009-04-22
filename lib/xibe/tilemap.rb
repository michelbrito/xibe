#
#	Xibé    Game Programming Library for Ruby
#	Copyright (C) 2009  Michel Brito, www.michelbrito.com
#
#	This library is free software; you can redistribute it and/or
#	modify it under the terms of the GNU Lesser General Public
#	License as published by the Free Software Foundation; either
#	version 2.1 of the License, or (at your option) any later version.
#
#	This library is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#	Lesser General Public License for more details.
#
#	You should have received a copy of the GNU Lesser General Public
#	License along with this library; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

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
