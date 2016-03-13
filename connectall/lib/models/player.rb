module Models
  class Player
    attr_accessor :player_num, :player_color, :player_type, :score

    def initialize(player_num, player_type, player_color)
      @player_num  = player_num
      @player_color = player_color
      @score = 0
    end

  end
end