module GameLogic
  class Rules

    ## 
    # Abstract implementation for rules
    # Implements generic checks and win conditions

    include AbstractInterface
  
    needs_implementation :check_winner, :winner, :win
    needs_implementation :addObserver, :observer
    needs_implementation :notifyObservers
    needs_implementation :update

    @observers = []

    def add_observer(observer)
      self.api_not_implemented(self)
    end

    ##
    # Checks if a player has won given rules, or has tied
    # Inputs: none
    # Outputs: none

    def check_for_winner
      @grid = @game_state_model::grid.getGrid
      if win
        @game_state_model::state = :win
        @game_state_model::winner = @winner
      elsif tie
         @game_state_model::state = :tie
      else
        @game_state_model::state = :active
      end
    end

    ##
    # Checks if a player has won with respect to vertical, horizontal, diagonal wins
    # Specific implementation of all three, in their respective classes (otto_rules, classic_rules)
    # Inputs: none
    # Outputs: boolean

    def win
      return ( check_vertical || check_horizontal || check_diagonal )
    end

    ##
    # Given the grid model, checks if every space is filled
    # If so, then the board has reached a 'tie' state and no winners are declared.
    # Inputs: none
    # Outputs: boolean

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