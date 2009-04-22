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
  
  class Image < Layer
    attr_reader :filename
    attr_accessor :src_x, :src_y
    def initialize(filename, transparent=false)
      super()
      @filename = filename
      @image = Image.create(@filename, transparent)
      @width = @image.w
      @height = @image.h
      @src_x = 0
      @src_y = 0
    end

    def self.load(filename)
      SDL::Surface.load(filename)
    end

    #Create a image
    def self.create(filename, transparent=false)
      img = load(filename)
      color_key = img.get_pixel(0,0)
      img.set_color_key(SDL::SRCCOLORKEY ,color_key) if transparent == true
      img.display_format
    end

    #Create a tiles from a image file
    def self.to_tiles(filename, width, height, transparent = false, margin = 0)
      img = create(filename, false)
      color_key = img.get_pixel(0,0)
      t_width = (img.w-margin) / (width + margin)
      t_height = (img.h-margin) / (height + margin)
      tiles = []
      i = 0
      while i < t_height do
        j = 0;
        while j < t_width do
          tiles << img.copy_rect(j*(width+margin)+margin, i*(height+margin)+margin, width, height)
          tiles[tiles.length - 1].set_color_key(SDL::SRCCOLORKEY, color_key) if transparent == true
          j += 1
        end
        i += 1
      end
      tiles
    end

    #Draw image
    def draw
      SDL::Surface.blit(@image, @src_x, @src_y, @width, @height, SDL.get_video_surface, @x, @y)
    end
  end
end
