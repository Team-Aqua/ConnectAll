module Models
  class Player
    include AbstractInterface
    attr_accessor :player_num, :player_color, :player_type, :score

    needs_implementation :make_move

    def initialize(player_num, player_color)
      @player_num  = player_num
      @player_color = player_color
      @score = 0
    end

    def increment_win_score
      @score = @score + 1
    end

    def make_move
      self.api_not_implemented(self)
    end

  end
end