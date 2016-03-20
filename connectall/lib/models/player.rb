module Models
  class Player
    include AbstractInterface
    attr_accessor :player_num, :player_color, :player_type, :score, :set_move, :make_move, :name, :ai

    def initialize(player_num, player_color, name)
      @player_num  = player_num
      @player_color = player_color
      @name = name
      @score = 0
      @move = nil
      @ai = nil
    end

    def increment_win_score
      @score = @score + 1
    end

    def set_move(x)
      @move = x
    end

  end
end