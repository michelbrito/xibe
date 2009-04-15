# To change this template, choose Tools | Templates
# and open the template in the editor.

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
