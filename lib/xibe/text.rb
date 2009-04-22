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

  class Text < Layer
    attr_reader :filename, :size
    attr_accessor :shadow, :text, :color, :bold
    def initialize(filename, size=10)
      super()
      @filename = filename
      @size = size
      @text = ""
      @color = 0x00
      SDL::TTF.init unless SDL::TTF.init?
      @font = SDL::TTF.open(@filename, @size)
    end

    def text_width
      text_size[0]
    end

    def text_height
      text_size[1]
    end

    def text_size
      @font.text_size(@text)
    end

    

    def style(args = {})
      style = SDL::TTF::STYLE_NORMAL
      style = SDL::TTF::STYLE_BOLD if args[:bold] == true
      style = style | SDL::TTF::STYLE_ITALIC if args[:italic] == true
      style = style | SDL::TTF::STYLE_UNDERLINE if args[:underline] == true
      @font.style = style
    end

    def draw
      r,g,b = Color.get_rgb(@color)
      @font.draw_solid_utf8(SDL.get_video_surface,@text,@x,@y,r,g,b)
    end
  end

end