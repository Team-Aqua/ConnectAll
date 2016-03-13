module Models
  class GameStateModel
    attr_accessor :state, :player_turn_state, :grid, :players, :game_mode, :game_type, :num_of_players, :game_mode_logic, :winner, :ai

    def initialize()
      @state = :active
      @winner = nil
      @grid = GridModel.new()
      @game_mode = nil
      @game_type = nil
      @game_mode_logic = nil
      @player_turn_state = 0
      @num_of_players = 0
      @players = []
      @ai = nil
    end

    def toggle_player_turn_state
      @player_turn_state = (@player_turn_state + 1) % @players.count
    end

  end
end