# To change this template, choose Tools | Templates
# and open the template in the editor.

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
