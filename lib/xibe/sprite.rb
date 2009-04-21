# To change this template, choose Tools | Templates
# and open the template in the editor.

module Xibe

  class Sprite < Layer
    attr_accessor :delay, :animate
    attr_reader :current_frame, :frames
    alias_method :old_clone, :clone
    def initialize(filename,width,height,transparent=false)
      super()
      @tiles = Image.to_tiles(filename, width, height, transparent)
      @width = width
      @height = height
      @delay = 200
      @animate = true
      @current_frame = 0
      @last_update = 0
      @frames = [0]
      @map = []
      @tiles.each do |tile|
        @map << tile.make_collision_map
      end
    end

    def frames=(frames)
      if @frames != frames
        @frames = frames
        first_frame
      end
    end

    #Go to first frame
    def first_frame
      @current_frame = 0
    end

    #Go to last frame
    def last_frame
      @current_frame = @frames.length - 1
    end

    #Go to next frame
    def next_frame
      @current_frame += 1
      first_frame if @current_frame > @frames.length - 1
    end

    #Go to previous frame
    def prev_frame
      @current_frame -= 1
      last_frame if @current_frame < 0
    end

    #Go to parameter frame
    def go_frame(frame)
      @current_frame = frame
    end

    #Draw sprite
    def draw
      animate if @animate == true
      draw_tile(@tiles[@frames[@current_frame]], @x, @y) if @visible == true
    end

    def collide_scene_left?
      left < 0
    end

    def collide_scene_right?
      right > $application.scene.width
    end

    def collide_scene_top?
      top < 0
    end

    def collide_scene_bottom?
      bottom >  $application.scene.height
    end

    def collide_with?(sprite)
      cmap.collision_check(@x,@y, sprite.cmap,sprite.x, sprite.y)
    end

    def collide_box?(sprite)
      cmap.bounding_box_check(@x,@y, sprite.cmap,sprite.x, sprite.y)
    end

    #TODO criar um esquema de grupo onde traga apenas os que pertecerem ao grupo tilemap
    def collide_with_tilemap?(pp=false)
      $application.scene.objects.each do |obj|
        if obj.is_a? Tilemap
          obj.cmap.each do |c|
            if pp
              return true if cmap.collision_check(@x,@y, c[:map], c[:x] + obj.x, c[:y] + obj.y)
            else
              return true if cmap.bounding_box_check(@x,@y, c[:map], c[:x] + obj.x, c[:y] + obj.y)
            end
            
          end
        end
      end
      return false
    end

    def cmap
      @map[@frames[@current_frame]]
    end

    private
    #Draw current frame
    def draw_tile(image, x, y)
      SDL::Surface.blit(image, 0, 0, image.w, image.h, SDL.get_video_surface, x - $application.scene.camera.x, y - $application.scene.camera.y)
    end

    #Animate sprite
    def animate
      curtime = SDL.get_ticks
      while curtime >= (@last_update + @delay)
        @last_update += @delay
        next_frame
      end
    end
  end
  
end
