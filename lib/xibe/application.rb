# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  
  class Application
    attr_reader :width, :height, :fps, :scene, :objects
    attr_accessor :fill

    #width, height: window size; fullscreen: fullscreen mode; fps: frames per seconds
    def initialize(width, height, fullscreen = false, fps=30)
      @width = width
      @height = height
      @fullscreen = fullscreen
      @fps = fps
      @fill = 0x00
      @objects = []

      SDL.init(SDL::INIT_EVERYTHING)

      mode = @fullscreen == true ? SDL::FULLSCREEN|SDL::HWSURFACE : SDL::HWSURFACE
      @screen = SDL::setVideoMode @width, @height, 16, mode
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
        SDL::Key.scan
        while event = SDL::Event2.poll
          case event
          when Event.quit
            quit
          end
        end
        input
        update
        @screen.fill_rect(0,0,@width,@height,@fill)
        draw
        @screen.flip
        SDL.delay( (1000 / @fps) - timer.ticks ) if timer.ticks < 1000 / @fps
      end
    end

    def input
    end

    def update
    end


    #Add the object to scene
    def add(*objs)
      objs.each do |obj|
        @objects << obj
      end
      @objects = @objects.uniq
    end

    #Delete the object from scene
    def delete(object)
      @objects.delete(object)
    end

    #Quit application
    def quit
      exit
    end

    private
    #Draw scene
    def draw
      objs = @objects.sort_by { |obj| [obj.z] }
      objs.each do |obj|
        obj.draw unless obj.visible == false
      end
    end
  end
end
