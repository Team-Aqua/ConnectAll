  module GameLogic
    class ClassicRules < Rules

    def initialize(game_state_model)
      @game_state_model = game_state_model
      @grid = @game_state_model::grid.getGrid
      @winner = nil
    end

    def check_for_winner
      @grid = @game_state_model::grid.getGrid
      if win
        @game_state_model::state = :win
        @game_state_model::winner = @winner
      else
        @game_state_model::state = :active
      end
    end

    def win
      state = @game_state_model::player_turn_state 
      # check horizontal, vertical, diagonal
      return ( check_vertical(state) || check_horizontal(state) || check_diagonal(state) )
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
                @winner = 2
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
                @winner = 1
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
                @winner = 2
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
                @winner = 1
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
            if @grid[y][x] == 2
              if x <= 4 and y <= 4 
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y + itr][x + itr] != 2
                    winstate = 0
                  end
                }  
                if winstate == 1
                  @winner = 2
                  return true
                end

              elsif x >= 3 and y <= 4

                winstate = 1
                (1..3).each { |itr|
                  if @grid[y + itr][x - itr] != 2
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 2
                  return true
                end  

              elsif x <= 4 and y >= 3
                
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y - itr][x + itr] != 2
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 2
                  return true
                end

              elsif x >= 3 and y >= 3
                
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y - itr][x - itr] != 2
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 2
                  return true
                end   
              end  
            end
          }
        }
      else # purple, 1
        (0..7).each { |y|
          (0..7).each { |x|
            if @grid[y][x] == 1
              if x <= 4 and y <= 4 
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y + itr][x + itr] != 1
                    winstate = 0
                  end
                }  
                if winstate == 1
                  @winner = 1
                  return true
                end

              elsif x >= 3 and y <= 4

                winstate = 1
                (1..3).each { |itr|
                  if @grid[y + itr][x - itr] != 1
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 1
                  return true
                end  

              elsif x <= 4 and y >= 3
                
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y - itr][x + itr] != 1
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 1
                  return true
                end

              elsif x >= 3 and y >= 3
                
                winstate = 1
                (1..3).each { |itr|
                  if @grid[y - itr][x - itr] != 1
                    winstate = 0
                  end
                }
                if winstate == 1
                  @winner = 1
                  return true
                end   
              end  
            end
          }
        }
      end
      return false
    end

  end # classicRules

end #gamelogic