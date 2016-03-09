class Grid
  
  def initialize
    @grid = empty_grid
    @green_block = Gosu::Image.new("assets/images/block_green.png")
    @purple_block = Gosu::Image.new("assets/images/block_purple.png")
    @green_potential = Gosu::Image.new("assets/images/block_green_potential.png")
    @purple_potential = Gosu::Image.new("assets/images/block_purple_potential.png")
    @grey_block = Gosu::Image.new("assets/images/block_grey.png")
  end

  def win(state)
    # check horizontal, vertical, diagonal
    winstate = check_vertical(state) or check_horizontal(state) or check_diagonal(state)
    puts winstate
    return winstate
  end

  def check_vertical(state)
    winstate = 0
    if state == 0 # green, 2
      (0..7).each { |y|
        (0..7).each { |x|
          if y < 5 and @grid[y][x] == 2
            winstate = 1
            (y..7).each { |yitr|
              if @grid[yitr][x] != 2
                winstate = 0
              end
            }  
            if winstate == 1
              return true
            end
          end  
        }
      }
    else # purple, 1
      (0..7).each { |y|
        (0..7).each { |x|
          if y < 5 and @grid[y][x] == 1
            winstate = 1
            (y..7).each { |yitr|
              if @grid[yitr][x] != 1
                winstate = 0
              end
            }  
            if winstate == 1
              return true
            end
          end  
        }
      }
    end
    return false
  end

  def check_horizontal(state)
    return false
  end

  def check_diagonal(state)
    return false
  end

  def update_grid(x, state)
    # 0 = green, 1 = purple
    # update the lowest 'y' position for the 'x' column
    for y in (7).downto(0)
      if @grid[y][x - 1] != 1 and @grid[y][x - 1] != 2
        if state == 0
          @grid[y][x - 1] = 2
          if y > 0
            @grid[y - 1][x - 1] = 20
          end
        else 
          @grid[y][x - 1] = 1
          if y > 0
            @grid[y - 1][x - 1] = 10
          end
        end
        return
      end
    end
  end

  def swap_potential(state)
    if state == 0 # green
      (0..7).each { |y|
        (0..7).each { |x|
          if @grid[y][x] == 10
            @grid[y][x] = 20
          end
        }
      }
    elsif state == 1 # purple
      (0..7).each { |y|
        (0..7).each { |x|
          if @grid[y][x] == 20
            @grid[y][x] = 10
          end
        }
      }
    end
  end

  def empty_grid
    # dev status:
    # 0 = nothing
    # 1 = purple confirmed
    # 10 = purple potential
    # 2 = green confirmed
    # 20 = green potential
    [
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 20, 20, 20, 20, 20, 20, 20, 20 ]
    ]
  end

  def update

  end

  def draw
    # original: 29, 116
    # shift by 35.5 horizontally and 38 vertically
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

  def shift_team

  end

end