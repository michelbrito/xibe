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

  class Mouse
    include SDL::Mouse

    def self.state
      SDL::Mouse.state
    end

    def self.show
      SDL::Mouse.show
    end

    def self.hide
      SDL::Mouse.hide
    end

    def self.show?
      SDL::Mouse.show?
    end

    def self.pos(x,y)
      SDL::Mouse.warp(x,y)
    end

    def self.button_pressed?(button)
       case button
       when BUTTON_LEFT
         return state[2]
       when BUTTON_MIDDLE
         return state[3]
       when BUTTON_RIGHT
         return state[4]
       end
       false
    end    
  end
  
end
