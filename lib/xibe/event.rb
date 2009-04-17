# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Event < SDL::Event
    def self.get
      poll
    end
  end
  
  SDL::Event.class_eval{alias :type :class}

  end
