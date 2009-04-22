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
  
  class Timer
    def initialize
      @start_ticks = 0
      @paused_ticks = 0
      @paused = false
      @started = false
    end

    #Start counter timer
    def start
      @started = true
      @paused = false
      @start_ticks = SDL.get_ticks
    end

    #Stop counter timer
    def stop
      @started = false
      @paused = false
    end

    #Pause counter timer
    def pause
      if @started == true && @paused == false
        @paused = true
        @paused_ticks = SDL.get_ticks - @start_ticks
      end
    end

    #Resume counter timer
    def resume
      if @paused == true
        @paused = false
        @start_ticks = SDL.get_ticks - @paused_ticks
        @paused_ticks = 0
      end
    end

    #Return current tick
    def ticks
      t = 0
      if @started == true
        if @paused == true
          t = @paused_ticks
        else
          t = SDL.get_ticks - @start_ticks
        end
      end
      t
    end

    #Return true if started == true
    def started?
      @started
    end

    #Return true if paused == true
    def paused?
      @paused
    end
  end
end
