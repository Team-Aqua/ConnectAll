module Models
  class GameStateModel
    attr_accessor :player_turn_state, :grid, :players

    def initialize()
      @state = :active
      @grid = GridModel.new()
      @player_turn_state = 0
      @players = [Player.new(1, 'rl', 'green'), Player.new(2, 'ai', 'purple')]
    end

    def toggle_player_turn_state
      @player_turn_state = (@player_turn_state + 1) % @players.count
    end

  end
end