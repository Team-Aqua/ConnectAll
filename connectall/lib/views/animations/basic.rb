module Animations
  class Basic
    #BASIC Y DOWN 
    attr_accessor :state

    def initialize(x, y, x_dest: x_dest, y_dest: y_dest, x_speed: x_speed, y_speed: y_speed, image: image, z: z)
      @state = :alive
      @x = x.to_f
      @y = y.to_f
      @x_dest = x_dest.to_f
      @y_dest = y_dest.to_f

      @y_offset = @y_dest - @y

      @x_speed = x_speed.to_f
      @y_speed = y_speed.to_f
      @image = image
      @z = z
      @frame_rate = 60.0
      @speed = 3.0
    end

    def accelaration
      @speed = (@speed * 1.05)
    end

    def animate
      Thread.new{anim}
    end

    def anim
      while (@y < @y_dest)
        @y = @y + @speed
        accelaration
        sleep((@y_speed/@frame_rate))
      end
      @state = :dead
      
    end

    def draw
      @image.draw(@x, @y, @z)
    end

  end
end