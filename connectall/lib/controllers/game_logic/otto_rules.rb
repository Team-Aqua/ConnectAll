module GameLogic
  class OttoRules < Rules

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
      # check horizontal, vertical, diagonal
      return ( check_vertical || check_horizontal || check_diagonal )
    end

    def check_vertical
      (0..7).each { |y|
        (0..7).each { |x|
          if y < 5 and @grid[y][x] == 2
            if @grid[y + 1][x] == 1 and @grid[y + 2][x] == 1 and @grid[y + 3][x] == 2
              @winner = 2
              return true
            end
          elsif y < 5 and @grid[y][x] == 1
            if @grid[y + 1][x] == 2 and @grid[y + 2][x] == 2 and @grid[y + 3][x] == 1
              @winner = 1
              return true
            end
          end  
        }
      }
      return false
    end

    def check_horizontal
      (0..7).each { |y|
        (0..7).each { |x|
          if x < 5 and @grid[y][x] == 2
            if @grid[y][x + 1] == 1 and @grid[y][x + 2] == 1 and @grid[y][x + 3] == 2
              @winner = 2
              return true
            end
          elsif x < 5 and @grid[y][x] == 1
            if @grid[y][x + 1] == 2 and @grid[y][x + 2] == 2 and @grid[y][x + 3] == 1
              @winner = 1
              return true
            end
          end   
        }
      }
      return false
    end

    def check_diagonal
      (0..7).each { |y|
        (0..7).each { |x|
          if x <= 4 and y <= 4 
            
            if @grid[y][x] == 2 and @grid[y + 1][x + 1] == 1 and @grid[y + 2][x + 2] == 1 and @grid[y + 3][x + 3] == 2
              @winner = 2
              return true
            elsif @grid[y][x] == 1 and @grid[y + 1][x + 1] == 2 and @grid[y + 2][x + 2] == 2 and @grid[y + 3][x + 3] == 1
              @winner = 1
              return true
            end 

          elsif x >= 3 and y <= 4

            if @grid[y][x] == 2 and @grid[y + 1][x - 1] == 1 and @grid[y + 2][x - 2] == 1 and @grid[y + 3][x - 3] == 2
              @winner = 2
              return true
            elsif @grid[y][x] == 1 and @grid[y + 1][x - 1] == 2 and @grid[y + 2][x - 2] == 2 and @grid[y + 3][x - 3] == 1
              @winner = 1
              return true
            end

          elsif x <= 4 and y >= 3
            
            if @grid[y][x] == 2 and @grid[y - 1][x + 1] == 1 and @grid[y - 2][x + 2] == 1 and @grid[y - 3][x + 3] == 2
              @winner = 2
              return true
            elsif @grid[y][x] == 1 and @grid[y - 1][x + 1] == 2 and @grid[y - 2][x + 2] == 2 and @grid[y - 3][x + 3] == 1
              @winner = 1
              return true
            end 

          elsif x >= 3 and y >= 3
            
            if @grid[y][x] == 2 and @grid[y - 1][x - 1] == 1 and @grid[y - 2][x - 2] == 1 and @grid[y - 3][x - 3] == 2
              @winner = 2
              return true
            elsif @grid[y][x] == 1 and @grid[y - 1][x - 1] == 2 and @grid[y - 2][x - 2] == 2 and @grid[y - 3][x - 3] == 1
              @winner = 1
              return true
            end 
          
          end  
        }
      }
      return false
    end
  end 
end