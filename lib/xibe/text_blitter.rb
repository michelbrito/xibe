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

  class TextBlitter < Layer
    attr_accessor :text
    attr_reader :filename
    def initialize(filename)
      super()
      @filename = filename
      @font = SDL::BMFont.open(@filename,SDL::BMFont::TRANSPARENT)
    end

    def color=(pixel)
      r,g,b = Color.get_rgb(pixel)
      @font.set_color(r,g,b)
    end

    def draw
      @font.textout(SDL.get_video_surface,@text,@x,@y)
    end
  end
  
end
