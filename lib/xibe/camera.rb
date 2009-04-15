# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  
  class Camera
    attr_accessor :x, :y, :width, :height
    def initialize
      @x = 0
      @y = 0
      @width = 0
      @height = 0
    end

   #Returns the Camera top position
    def top
      @y
    end

    #Returns the Camera right position
    def right
      @x + @width
    end

    #Returns the Camera bottom position
    def bottom
      @y + @height
    end

    #Returns the Camera left position
    def left
      @x
    end

    #Sets X and Y Camera position
    def pos(x, y)
      @x = x
      @y = y
    end
  end
end
