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
  
  class Layer
    attr_accessor :x, :y, :width, :height, :z, :visible
    def initialize
      @x = 0
      @y = 0
      @width = 0
      @height = 0
      @z = 0
      @visible = true
    end

    def show
      @visible = true
    end

    def hide
      @visible = false
    end

    #Returns the top position
    def top
      @y
    end

    #Returns the right position
    def right
      @x + @width
    end

    #Returns the bottom position
    def bottom
      @y + @height
    end

    #Returns the left position
    def left
      @x
    end

    #Sets X and Y position
    def pos(x, y)
      @x = x
      @y = y
    end
  end
end
