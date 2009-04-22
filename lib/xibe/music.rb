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

  class Music < Mixer
    def initialize(filename)
      super()
      @music = SDL::Mixer::Music.load(filename)
    end

    def play(loops = 0)
      SDL::Mixer.play_music(@music,loops)
    end

    def pause
      SDL::Mixer.pause_music
    end

    def resume
      SDL::Mixer.resume_music
    end

    def stop
      SDL::Mixer.halt_music
    end

    def rewind
      SDL::Mixer.rewind_music
    end
  end
  
end
