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
