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
  
  class Sample < Mixer
    def initialize(filename)
      super()
      @wave = SDL::Mixer::Wave.load(filename)
    end

    #loops (-1 = infinitely, 0 = no repeat)
    #channel (-1 = first free unreserved channel)
    def play(loops= 0, channel = 0)
      SDL::Mixer.play_channel(channel, @wave, loops)
    end

    #channel (-1 pause all channels)
    def pause(channel = 0)
      SDL::Mixer.pause(channel)
    end

    def pause_all
      SDL::Mixer.pause(channel)
    end

    #channel (-1 resume all channels)
    def resume(channel = 0)
      SDL::Mixer.resume(channel)
    end

    def resume_all
      SDL::Mixer.resume(-1)
    end

    #channel (-1 stop all channels)
    def stop(channel = 0)
      SDL::Mixer.halt(channel)
    end

    def stop_all
      SDL::Mixer.halt(-1)
    end
  end

end
