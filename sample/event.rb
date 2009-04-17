require 'xibe'
include Xibe

class Example < Application
  def initialize
    super(320,240)
    Mouse.show
  end

  def input(e)
    if e.type == KEYDOWN
      puts "KEYDOWN: #{Key.name(e.sym)}"
    end
    
    if e.type == KEYUP
      puts "KEYUP: #{Key.name(e.sym)}"
    end

    if e.type == MOUSEMOTION
      puts "MOUSEMOTION: #{e.x}, #{e.y}"
    end

    if e.type == MOUSEBUTTONDOWN
      if e.button == MOUSE_LEFT
        puts "MOUSEBUTTONDOWN: BUTTON_LEFT"
      elsif e.button == MOUSE_MIDDLE
        puts "MOUSEBUTTONDOWN: BUTTON_MIDDLE"
      elsif e.button == MOUSE_RIGHT
        puts "MOUSEBUTTONDOWN: BUTTON_RIGHT"
      end
    elsif e.type == MOUSEBUTTONUP
      if e.button == MOUSE_LEFT
        puts "MOUSEBUTTONUP: BUTTON_LEFT"
      elsif e.button == MOUSE_MIDDLE
        puts "MOUSEBUTTONUP: BUTTON_MIDDLE"
      elsif e.button == MOUSE_RIGHT
        puts "MOUSEBUTTONUP: BUTTON_RIGHT"
      end
    end
  end
end

Example.new.run