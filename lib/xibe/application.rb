#
#	Xibé    Game Programming Library for Ruby
#	Copyright (C) 2009  Michel Brito, www.michelbrito.com
#
#	This library is free software; you can redistribute it and/or
#	modify it under the terms of the GNU Lesser General Public
#	License as published by the Free Software Foundation; either
#	version 2.1 of the License, or (at your option) any later version.
#
#	This library is distributed in the hope that it will be useful,
#	but WITHOUT ANY WARRANTY; without even the implied warranty of
#	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#	Lesser General Public License for more details.
#
#	You should have received a copy of the GNU Lesser General Public
#	License along with this library; if not, write to the Free Software
#	Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#

module Xibe
  
  class Application
    attr_reader :width, :height, :fps, :screen
    attr_accessor :scene

    #width, height: window size; fullscreen: fullscreen mode; fps: frames per seconds
    def initialize(width, height, fullscreen = false, fps=30)
      $application = self
      @width = width
      @height = height
      @fullscreen = fullscreen
      @fps = fps
      @objects = []

      SDL.init(SDL::INIT_EVERYTHING)

      mode = @fullscreen == true ? SDL::FULLSCREEN|SDL::HWSURFACE : SDL::HWSURFACE
      @screen = SDL::setVideoMode @width, @height, 16, mode
      Mouse.hide
      @scene = Scene.new(@width,@height)
    end

    #Sets the window title
    def title=(title)
      SDL::WM.set_caption title, ''
    end

    #Sets the window icon
    def icon=(filename)
      SDL::WM.icon = SDL::Surface.load filename
    end

    #Run application
    def run
      timer = Timer.new
      loop do
        timer.start
        Key.scan
        while event = Event.get
          input(event)
          exit if event.type == QUIT
        end
        update
        draw
        @screen.flip
        SDL.delay( (1000 / @fps) - timer.ticks ) if timer.ticks < 1000 / @fps
      end
    end

    def input(e)
      @scene.input(e)
    end

    def update
      @scene.update
    end


    #Add the object to scene
    def add(*objs)
      @scene.add(*objs)
    end

    #Delete the object from scene
    def delete(object)
      @scene.delete(object)
    end

    def fill=(color)
      @scene.fill = color
    end

    def fill
      @scene.fill
    end

    def draw
      @screen.fill_rect(0,0,@width,@height,@scene.fill)
      @scene.draw
    end
  end
end
