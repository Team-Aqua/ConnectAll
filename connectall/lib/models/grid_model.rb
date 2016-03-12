module Models
  class GridModel
    attr_accessor :setValue, :getValue

    def initialize(x: 8, y: 8)
      @x = x
      @y = y
      @grid = generate_grid
    end

    def generate_grid
      grid = []
      (0..@y).each { |y|
        row = []
        (0..@x).each { |x|
          row.push(0)
        }
        grid.push(row)
      }
      return grid
    end

    def getGrid
      @grid
    end

    def getValue(x, y)
      return @grid[y][x]
    end

    def setValue(x, y, val)
      @grid[y][x] = val
    end

    def add_tile(x, player_num)
      for y in (7).downto(0)
        if getValue(x-1, y) == 0
          setValue(x-1, y, player_num+1)
          return
        end
      end
    end

    def reset
      @grid = generate_grid
    end

    def print_grid
      puts ""
      puts ""
      puts ""
      puts ""
      puts ""
      @grid.each do |row|
        print row
        puts ""
      end
    end

  end
end