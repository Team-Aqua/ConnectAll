require_relative 'grid.rb'
require_relative 'gamelogic.rb'

class Board
  def initialize(window)
    @window = window
    @state = 0
    @help_state = 0
    @image = Gosu::Image.new("assets/images/img_grid.png", :tileable => true)
    @background_image_green = Gosu::Image.new("assets/images/bg_green.png", :tileable => false)
    @background_image_purple = Gosu::Image.new("assets/images/bg_purple.png", :tileable => false)
    @grid = Grid.new
    @gamelogic = GameLogic.new(@window)
    @x = @y = 0.0
    # key: 68 pixels between spaces
    @win_state = 100
  end

  def win(playernum)
    if playernum == 0
      @win_state = 0
    else 
      @win_state = 1
    end
  end

  def place(x, y)
    @x, @y = x, y
  end

  def update_grid(x)
    @grid.update_grid(x, @state)
    @gamelogic.check_winner(@grid, @state)
  end

  def update
    @grid.update
  end

  def draw
    @grid.draw
    @image.draw(@x, @y, 1)
    if @win_state == 0
      @background_image_green.draw(0, 0, 0)
    elsif @win_state == 1
      @background_image_purple.draw(0, 0, 0)
    else 
      if @state == 0
        @background_image_green.draw(0, 0, 0)
      else 
        @background_image_purple.draw(0, 0, 0)
      end
    end
  end

  def shift_team
    if @state == 0
      @state = 1 
    else 
      @state = 0
    end
    @grid.swap_potential(@state)
  end

end