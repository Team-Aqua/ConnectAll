  module GameLogic
    class ClassicRules < Rules

    def check_winner(grid, state)
      if grid.win(state)
        winner(state)
      end
    end

    def winner(playernum)
      @window.win(playernum)
    end

    def win(state)
      # check horizontal, vertical, diagonal
      winstate = check_vertical(state) || check_horizontal(state) || check_diagonal(state)
      return winstate
    end

    def check_vertical(state)
      winstate = 0
      if state == 0 # green, 2
        (0..7).each { |y|
          (0..7).each { |x|
            if y < 5 and @grid[y][x] == 2
              winstate = 1
              (y..y + 3).each { |yitr|
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
              (y..y + 3).each { |yitr|
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
      winstate = 0
      if state == 0 # green, 2
        (0..7).each { |y|
          (0..7).each { |x|
            if x < 5 and @grid[y][x] == 2
              winstate = 1
              (x..x + 3).each { |xitr|
                if @grid[y][xitr] != 2
                  # puts "Failed at: #{xitr} with result: #{@grid[y][xitr]}" 
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
            if x < 5 and @grid[y][x] == 1
              winstate = 1
              (x..x + 3).each { |xitr|
                if @grid[y][xitr] != 1
                  # puts "Failed at: #{xitr} with result: #{@grid[y][xitr]}" 
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

    def check_diagonal(state)
      winstate = 0
      if state == 0 # green, 2
        (0..7).each { |y|
          (0..7).each { |x|
            if x < 5 and y < 5 and x > 2 and y > 2 and @grid[y][x] == 2
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y + itr][x + itr] != 2
                  winstate = 0
                end
              }  
              if winstate == 1
                return true
              end

              winstate = 1
              (1..3).each { |itr|
                if @grid[y + itr][x - itr] != 2
                  winstate = 0
                end
              }
              if winstate == 1
                return true
              end  
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y - itr][x + itr] != 2
                  winstate = 0
                end
              }
              if winstate == 1
                return true
              end
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y - itr][x - itr] != 2
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
            if x < 5 and y < 5 and x > 2 and y > 2 and @grid[y][x] == 1
      
              winstate = 1
              (1..3).each { |itr|
                if @grid[y + itr][x + itr] != 1
                  winstate = 0
                end
              }  
              if winstate == 1
                return true
              end
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y + itr][x - itr] != 1
                  winstate = 0
                end
              }  
              if winstate == 1
                return true
              end
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y - itr][x + itr] != 1
                  winstate = 0
                end
              }  
              if winstate == 1
                return true
              end
              
              winstate = 1
              (1..3).each { |itr|
                if @grid[y - itr][x - itr] != 1
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

  end # classicRules

end #gamelogic