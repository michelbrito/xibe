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
  
  class Color
    def self.map_rgb(r,g,b)
      SDL.get_video_surface.map_rgb(r,g,b)
    end

    def self.map_rgba(r,g,b,a)
      SDL.get_video_surface.map_rgba(r,g,b,a)
    end

    def self.get_rgb(pixel)
      SDL.get_video_surface.get_rgb(pixel)
    end

    def self.get_rgba(pixel)
      SDL.get_video_surface.get_rgba(pixel)
    end

    def self.aqua
      map_rgb(0,255,255)
    end

    def self.black
      map_rgb(0,0,0)
    end

    def self.blue
      map_rgb(0,0,255)
    end

    def self.fuchsia
      map_rgb(255,0,255)
    end

    def self.gray
      map_rgb(128,128,128)
    end    

    def self.green
      map_rgb(0,128,0)
    end

    def self.lime
      map_rgb(0,255,0)
    end

    def self.maroon
      map_rgb(128,0,0)
    end

    def self.navy
      map_rgb(0,0,128)
    end

    def self.olive
      map_rgb(128,128,0)
    end
    
    def self.orange
      map_rgb(255,165,0)
    end
    
    def self.purple
      map_rgb(128,0,128)
    end

    def self.red
      map_rgb(255,0,0)
    end

    def self.silver
      map_rgb(192,192,192)
    end

    def self.teal
      map_rgb(0,128,128)
    end

    def self.white
      map_rgb(255,255,255)
    end

    def self.yellow
      map_rgb(255,255,0)
    end    
  end
  
end
