module GameLogic
  class Rules

    include AbstractInterface
  
    needs_implementation :check_winner, :winner, :win
    needs_implementation :addObserver, :observer
    needs_implementation :notifyObservers
    needs_implementation :update

    @observers = []
    def add_observer(observer)
      self.api_not_implemented(self)
    end

    def check_for_winner
      @grid = @game_state_model::grid.getGrid
      if win
        @game_state_model::state = :win
        @game_state_model::winner = @game_state_model::player_turn_state - 1
      elsif tie
         @game_state_model::state = :tie
      else
        @game_state_model::state = :active
      end
    end

    def win
      # check horizontal, vertical, diagonal
      return ( check_vertical || check_horizontal || check_diagonal )
    end

    def tie
      (0..7).each { |col|
         if (@game_state_model::grid.column_depth(col) > 0)
            return false
         end
      }
      return true
    end
  end
end