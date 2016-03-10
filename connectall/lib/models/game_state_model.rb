module Models
  class GameStateModel
    def initialize()
      @state = :active
      @grid = Grid.new()
    end

    def getGridModel
      @grid
    end
  end
end