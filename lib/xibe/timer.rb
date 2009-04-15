# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe
  
  class Timer
    def initialize
      @start_ticks = 0
      @paused_ticks = 0
      @paused = false
      @started = false
    end

    #Start counter timer
    def start
      @started = true
      @paused = false
      @start_ticks = SDL.get_ticks
    end

    #Stop counter timer
    def stop
      @started = false
      @paused = false
    end

    #Pause counter timer
    def pause
      if @started == true && @paused == false
        @paused = true
        @paused_ticks = SDL.get_ticks - @start_ticks
      end
    end

    #Resume counter timer
    def resume
      if @paused == true
        @paused = false
        @start_ticks = SDL.get_ticks - @paused_ticks
        @paused_ticks = 0
      end
    end

    #Return current tick
    def ticks
      t = 0
      if @started == true
        if @paused == true
          t = @paused_ticks
        else
          t = SDL.get_ticks - @start_ticks
        end
      end
      t
    end

    #Return true if started == true
    def started?
      @started
    end

    #Return true if paused == true
    def paused?
      @paused
    end
  end
end
