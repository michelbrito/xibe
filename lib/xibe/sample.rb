# To change this template, choose Tools | Templates
# and open the template in the editor.

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
