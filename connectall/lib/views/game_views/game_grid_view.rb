module Views
  class GridView
    def initialize(window, controller, model)
      @window = window
      @controller = controller
      @model = model
      @grid_model = model::grid
      @grid_xpos = 29
      @grid_ypos = 116

      @grey_block = Gosu::Image.new("assets/images/block_grey.png")

      @tiles = { 'green' => Gosu::Image.new("assets/images/block_green.png"),
                'yellow' => Gosu::Image.new("assets/images/block_yellow.png"),
                'red' => Gosu::Image.new("assets/images/block_red.png"),
                'teal' => Gosu::Image.new("assets/images/block_teal.png"),
                'orange' => Gosu::Image.new("assets/images/block_orange.png"),
                'white' => Gosu::Image.new("assets/images/block_white.png"),
                'black' => Gosu::Image.new("assets/images/block_black.png"),
                'grey' => Gosu::Image.new("assets/images/block_grey.png"),
                'purple' => Gosu::Image.new("assets/images/block_purple.png") }
      
      @potential_tiles = { 'green' => Gosu::Image.new("assets/images/block_green_potential.png"),
                          'purple' => Gosu::Image.new("assets/images/block_purple_potential.png") }
    end

    def getGridModelValue(x, y)
      @grid_model.getValue(x, y)
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
      draw_tiles
      draw_potentials
    end

    def update

    end

    def clicked
      
    end

  end
end