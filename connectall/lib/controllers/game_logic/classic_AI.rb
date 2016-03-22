module GameLogic

  class ClassicAI < AI
    attr_accessor :choose_location, :gridModel, :grid
    ##
    # Classic AI implementation
    # 

    def initialize(model)
      @model = model
      @gridModel = @model::grid
      @grid = @gridModel.getGrid
    end

    ##
    # Chooses the location for AI position
    # Inputs: none
    # Outputs: x position

    ## TODO: Refractor into seperate functions.
    def choose_location
      # Check if AI can win.
      y = 0
      (0..7).each {|x|
        y = @gridModel.column_depth(x+1)
        # Check vertical
        if y <= 5
          if @grid[y][x] == 2 and @grid[y+1][x] == 2 and @grid[y+2][x] == 2
            return x+1
          end
        end
        
        # Check Horizontal
        y = @model::grid.column_depth(x+1) - 1
        if x < 5 
          if @grid[y][x+1] == 2 and @grid[y][x+2] == 2 and @grid[y][x+3] == 2
            return x+1
          end
        end
        
        if x < 6 and x > 0 
          if @grid[y][x-1] == 2 and @grid[y][x+1] == 2 and @grid[y][x+2] == 2
            return x+1
          end
        end
        
        if x < 7 and x > 1 
          if @grid[y][x-2] == 2 and @grid[y][x-1] == 2 and @grid[y][x+1] == 2
            return x+1
          end
        end
        
        if x > 2 
          if @grid[y][x-3] == 2 and @grid[y][x-2] == 2 and @grid[y][x-1] == 2
            return x+1
          end
        end
        
        # Check Diagonal
        y = @gridModel.column_depth(x+1)
        
        if y > 3 and x < 5
          if @grid[y - 2][x + 1] == 2 and @grid[y - 3][x + 2] == 2 and @grid[y - 4][x + 3] == 2
            return x+1
          end
        end
        
        if y < 6 and x < 5
          if @grid[y][x + 1] == 2 and @grid[y + 1][x + 2] == 2 and @grid[y + 2][x + 3] == 2
            return x+1
          end
        end
        
        if y > 2 and y < 8 and x < 6 and x > 0
          if @grid[y][x - 1] == 2 and @grid[y - 2][x + 1] == 2 and @grid[y - 3][x + 2] == 2
            return x+1
          end
        end
        
        if y > 1 and y < 7 and x < 6 and x > 1
          if @grid[y - 2][x - 1] == 2 and @grid[y][x + 1] == 2 and @grid[y + 1][x + 2] == 2
            return x+1
          end
        end
        
        if y > 1 and y < 7 and x < 7 and x > 1
          if @grid[y + 1][x - 2] == 2 and @grid[y][x - 1] == 2 and @grid[y - 2][x + 1] == 2
            return x+1
          end
        end
        
        if y > 2 and y < 8 and x < 7 and x > 1
          if @grid[y - 3][x - 2] == 2 and @grid[y - 2][x - 1] == 2 and @grid[y][x + 1] == 2
            return x+1
          end
        end
        
        if y <= 5 and x >= 3
          if @grid[y + 2][x - 3] == 2 and @grid[y + 1][x - 2] == 2 and @grid[y][x - 1] == 2
            return x+1
          end
        end
        
        if y > 3 and x >= 3
          if @grid[y - 4][x - 3] == 2 and @grid[y - 3][x - 2] == 2 and @grid[y-2][x - 1] == 2
            return x+1
          end
        end
      }
      
      # Check if Player can win.
      y = 0
      (0..7).each {|x|
        y = @gridModel.column_depth(x+1)
        # Check vertical
        if y <= 5
          if @grid[y][x] == 1 and @grid[y+1][x] == 1 and @grid[y+2][x] == 1
            return x+1
          end
        end
        
        # Check Horizontal
        y = @gridModel.column_depth(x+1) - 1
        if x < 5
          if @grid[y][x+1] == 1 and @grid[y][x+2] == 1 and @grid[y][x+3] == 1
            return x+1
          end
        end
        
        if x < 6 and x > 0 
          if @grid[y][x-1] == 1 and @grid[y][x+1] == 1 and @grid[y][x+2] == 1
            return x+1
          end
        end
        
        if x < 7 and x > 1 
          if @grid[y][x-2] == 1 and @grid[y][x-1] == 1 and @grid[y][x+1] == 1
            return x+1
          end
        end
        
        if x > 2
          if @grid[y][x-3] == 1 and @grid[y][x-2] == 1 and @grid[y][x-1] == 1
            return x+1
          end
        end
        
        # Check Diagonal
        y = @gridModel.column_depth(x+1)
        
        if y > 3 and x < 5
          if @grid[y - 2][x + 1] == 1 and @grid[y - 3][x + 2] == 1 and @grid[y - 4][x + 3] == 1
            return x+1
          end
        end

        if y < 6 and x < 5
          if @grid[y][x + 1] == 1 and @grid[y + 1][x + 2] == 1 and @grid[y + 2][x + 3] == 1
            return x+1
          end
        end

        if y > 2 and y < 8 and x < 6 and x > 0
          if @grid[y][x - 1] == 1 and @grid[y - 2][x + 1] == 1 and @grid[y - 3][x + 2] == 1
            return x+1
          end
        end

        if y > 1 and y < 7 and x < 6 and x > 1
          if @grid[y - 2][x - 1] == 1 and @grid[y][x + 1] == 1 and @grid[y + 1][x + 2] == 1
            return x+1
          end
        end

        if y > 1 and y < 7 and x < 7 and x > 1
          if @grid[y + 1][x - 2] == 1 and @grid[y][x - 1] == 1 and @grid[y - 2][x + 1] == 1
            return x+1
          end
        end
        
        if y > 2 and y < 8 and x < 7 and x > 1
          if @grid[y - 3][x - 2] == 1 and @grid[y - 2][x - 1] == 1 and @grid[y][x + 1] == 1
            return x+1
          end
        end

        if y <= 5 and x >= 3
          if @grid[y + 2][x - 3] == 1 and @grid[y + 1][x - 2] == 1 and @grid[y][x - 1] == 1
            return x+1
          end
        end
        
        if y > 3 and x >= 3
          if @grid[y - 4][x - 3] == 1 and @grid[y - 3][x - 2] == 1 and @grid[y-2][x - 1] == 1
            return x+1
          end
        end
      }
      
      
      # No Better Choice
      rando = Random.new
      return rando.rand(1..8)
    end
  end
end
