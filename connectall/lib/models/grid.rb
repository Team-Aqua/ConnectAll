module Models
  class Grid
    def initialize(x: 0, y: 0)
      @x = x
      @y = y
      @grid =[
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 1, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 2, 0, 0, 0 ],
      [ 0, 0, 0, 0, 0, 0, 0, 0 ],
      [ 0, 0, 0, 0, 1, 0, 1, 2 ],
      [ 0, 0, 0, 0, 1, 0, 1, 2 ],]
    end

    def getGrid
      @grid
    end

    def getValue(x, y)
      return @grid[y][x]
    end
  end
end