module Models
  class RealPlayer < Player
    def initialize(player_num, player_color, name)
      super(player_num, player_color, name)
      @move = nil
    end

    def make_move
      if @move == nil
        return false
      else
        yield @move, @player_num, @player_color, 0.0
        @move = nil
        return true
      end
    end

  end
end