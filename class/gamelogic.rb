require_relative 'grid.rb'

class GameLogic

    def initialize(window)
      @window = window
    end

    def check_winner(grid, state)
      if grid.win(state)
        winner(state)
      end
    end

    def winner(playernum)
      @window.win(playernum)
    end

end