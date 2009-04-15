# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class TextBlitter < Layer
    attr_accessor :text
    attr_reader :filename
    def initialize(filename)
      super()
      @filename = filename
      @font = SDL::BMFont.open(@filename,SDL::BMFont::TRANSPARENT)
    end

    def color=(pixel)
      r,g,b = Color.get_rgb(pixel)
      @font.set_color(r,g,b)
    end

    def draw
      @font.textout(SDL.get_video_surface,@text,@x,@y)
    end
  end
  
end
