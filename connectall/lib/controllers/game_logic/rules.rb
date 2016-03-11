module GameLogic
  class Rules

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
  end
end