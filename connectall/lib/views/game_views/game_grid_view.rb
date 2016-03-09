module Views
  class GridView
    def initialize(window)
      @window = window

      @green_block = Gosu::Image.new("ConnectAll/connectall/assets/images/block_green.png")
      @purple_block = Gosu::Image.new("assets/images/block_purple.png")
      @green_potential = Gosu::Image.new("assets/images/block_green_potential.png")
      @purple_potential = Gosu::Image.new("assets/images/block_purple_potential.png")
      @grey_block = Gosu::Image.new("assets/images/block_grey.png")
    end

    def draw
      ypos = 116
      (0..7).each { |y|
        xpos = 29
        (0..7).each { |x|
          if @grid[y][x] == 1
            @purple_block.draw(xpos, ypos, 15)
          elsif @grid[y][x] == 10
            @purple_potential.draw(xpos, ypos, 15)
          elsif @grid[y][x] == 2
            @green_block.draw(xpos, ypos, 15)
          elsif @grid[y][x] == 20
            @green_potential.draw(xpos, ypos, 15)
          else 
            @grey_block.draw(xpos, ypos, 5)
          end
          xpos = xpos + 35.5
        }
        ypos = ypos + 38
      }
    end
  end
end