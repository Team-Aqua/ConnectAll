module Models
  class AIPlayer < Player

    def initialize(player_num, player_color, ai, name)
      super(player_num, player_color, name)
      @ai = ai
    end

    def make_move
      move = @ai.choose_location
      yield move, @player_num, @player_color, 1.0
      @move = nil
      return true
    end


  end
end