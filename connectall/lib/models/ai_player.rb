module Models
  class AIPlayer < Player

    def initialize(player_num, player_color, ai)
      super(player_num, player_color)
      @ai = ai
    end

    def make_move
      move = @ai.choose_location
      yield move, @player_num, @player_color
      @move = nil
      return true
    end


  end
end