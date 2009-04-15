# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  
  class Layer
    attr_accessor :x, :y, :width, :height, :z, :visible
    def initialize
      @x = 0
      @y = 0
      @width = 0
      @height = 0
      @z = 0
      @visible = true
    end

    def show
      @visible = true
    end

    def hide
      @visible = false
    end

    #Returns the top position
    def top
      @y
    end

    #Returns the right position
    def right
      @x + @width
    end

    #Returns the bottom position
    def bottom
      @y + @height
    end

    #Returns the left position
    def left
      @x
    end

    #Sets X and Y position
    def pos(x, y)
      @x = x
      @y = y
    end
  end
end
