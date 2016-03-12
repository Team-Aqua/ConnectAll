module Views
  class GridView
    def initialize(window, controller, model)
      @window = window
      @controller = controller
      @model = model
      @grid_model = model::grid
      @grid_xpos = 29
      @grid_ypos = 116

      @grid_top

      @grey_block = Gosu::Image.new("assets/images/block_grey.png")

      @tiles = { 'green' => Gosu::Image.new("assets/images/block_green.png"),
                'yellow' => Gosu::Image.new("assets/images/block_yellow.png"),
                'pink' => Gosu::Image.new("assets/images/block_pink.png"),
                'teal' => Gosu::Image.new("assets/images/block_teal.png"),
                'orange' => Gosu::Image.new("assets/images/block_orange.png"),
                'white' => Gosu::Image.new("assets/images/block_white.png"),
                'black' => Gosu::Image.new("assets/images/block_black.png"),
                'grey' => Gosu::Image.new("assets/images/block_grey.png"),
                'purple' => Gosu::Image.new("assets/images/block_purple.png") }
      
      @potential_tiles = { 'green' => Gosu::Image.new("assets/images/block_green_potential.png"),
                          'purple' => Gosu::Image.new("assets/images/block_purple_potential.png") }

      @falling_tiles = []
      @click_sound = Gosu::Sample.new(@window, "assets/sounds/quick_beat.mp3")
      @swoosh_sound = Gosu::Sample.new(@window, "assets/sounds/fast_swish.mp3")
    end

    def getGridModelValue(x, y)
      @grid_model.getValue(x, y)
    end

    def animate_tile_drop(x, player_color)
      @swoosh_sound.play
      animation = Animations::Basic.new(x, @grid_ypos, x_dest: 0, y_dest: @grid_ypos+(38*7), x_speed: 0, y_speed: 0.1, image: @tiles[player_color], z: 15)
      animation.animate
      @falling_tiles.push(animation)
    end

    def draw_tiles
      ypos = @grid_ypos
      (0..7).each { |y|
        xpos = @grid_xpos
        (0..7).each { |x|
          if @grid_model.getValue(x, y) != 0
            @tiles[@model::players[@grid_model.getValue(x, y)-1]::player_color].draw(xpos, ypos, 15)
          else
            @grey_block.draw(xpos, ypos, 5)
          end
          xpos = xpos + 35.5
        }
        ypos = ypos + 38
      }
    end

    def draw_potentials
      # ypos = @grid_ypos
      # (0..7).each { |y|
      #   xpos = @grid_xpos
      #   (0..7).each { |x|
      #     if @grid_model.getValue(x, y) != 0
      #       @potential_tiles[@model::players[@model.player_turn_state]::player_color].draw(xpos, ypos, 15)
      #       break
      #     end
      #     xpos = xpos + 35.5
      #   }
      #   ypos = ypos + 38
      # }
    end

    def draw
      if @falling_tiles != []
        @falling_tiles.each do |tile|
          tile.draw
        end
      end
      draw_tiles
      draw_potentials
    end

    def update
      if @falling_tiles != []
        @falling_tiles.each do |tile|
          if tile::state == :dead
            @click_sound.play
            @falling_tiles.delete(tile)
          end
        end
      end
    end

    def clicked
      
    end

  end
end