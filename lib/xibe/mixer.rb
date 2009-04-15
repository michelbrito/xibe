# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  class Mixer
    @@initialized = false
    def initialize
      unless @@initialized == true
        SDL::Mixer.open(22050, SDL::Mixer::DEFAULT_FORMAT, 2, 512)
        @@initialized = true
      end
    end
  end
end
