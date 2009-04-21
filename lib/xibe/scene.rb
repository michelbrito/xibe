# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Scene
    attr_accessor :fill, :camera
    attr_reader :width, :height, :objects
    def initialize(width, height,fill = 0x00)
      @width = width
      @height = height
      @fill = fill
      @camera = Camera.new
      window = SDL.get_video_surface
      @camera.width = window.w
      @camera.height = window.h
      @objects = []
    end

    def input(e)
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

    #Draw scene
    def draw
      objs = @objects.sort_by { |obj| [obj.z] }
      objs.each do |obj|
        obj.draw unless obj.visible == false
      end
    end

    def show
      $application.scene = self
      $application.screen.set_clip_rect(0,0,@width,@height)
    end
  end
  
end
