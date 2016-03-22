module Models
  class GameStateModel

    ##
    # Generic game state model for game processes.
    # Holds data for game

    attr_accessor :state, :player_turn_state, :grid, :players, :game_mode, :game_type, :num_of_players, :game_mode_logic, :winner, :ai

    def initialize()
      @state = :active
      @winner = nil
      @grid = GridModel.new
      @game_mode = nil
      @game_type = nil
      @game_mode_logic = nil
      @player_turn_state = 0
      @num_of_rl_players = 0
      @players = []
      @ai = nil
    end

    ##
    # Changes turn state depending on number of players
    # Inputs: none
    # Outputs: none

    def toggle_player_turn_state
      # @players[@player_turn_state].move = nil
      @player_turn_state = (@player_turn_state + 1) % @players.count
    end

  end
end