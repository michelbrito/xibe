# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Text < Layer
    attr_reader :filename, :size
    attr_accessor :shadow, :text, :color, :bold, :valign, :halign
    def initialize(filename, size=10)
      super()
      @filename = filename
      @size = size
      @text = ""
      @color = 0x00
      SDL::TTF.init unless SDL::TTF.init?
      @font = SDL::TTF.open(@filename, @size)
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
      w, h = @font.text_size(@text)
      @width = w if @width == 0
      @height = h if @height == 0
      x = @x
      y = @y
      x = @x + (@width - w) if @halign == :right
      x = @x + (@width - w)/2 if @halign == :center
      y = @y + (@height - h) if @valign == :bottom
      y =  @y + (@height - h)/2 if @valign == :center
      @font.draw_solid_utf8(SDL.get_video_surface,@text,x,y,r,g,b)
    end
  end

end