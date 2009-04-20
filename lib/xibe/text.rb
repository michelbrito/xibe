# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Text < Layer
    attr_reader :filename, :size
    attr_accessor :shadow, :text, :color, :bold
    def initialize(filename, size=10)
      super()
      @filename = filename
      @size = size
      @text = ""
      @color = 0x00
      SDL::TTF.init unless SDL::TTF.init?
      @font = SDL::TTF.open(@filename, @size)
    end

    def text_width
      text_size[0]
    end

    def text_height
      text_size[1]
    end

    def text_size
      @font.text_size(@text)
    end

    

    def style(args = {})
      style = SDL::TTF::STYLE_NORMAL
      style = SDL::TTF::STYLE_BOLD if args[:bold] == true
      style = style | SDL::TTF::STYLE_ITALIC if args[:italic] == true
      style = style | SDL::TTF::STYLE_UNDERLINE if args[:underline] == true
      @font.style = style
    end

    def draw
      r,g,b = Color.get_rgb(@color)
      @font.draw_solid_utf8(SDL.get_video_surface,@text,@x,@y,r,g,b)
    end
  end

end