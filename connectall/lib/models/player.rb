module Models
  class Player
    attr_accessor :player_num, :player_color, :player_type

    def initialize(player_num, player_type, player_color)
      @player_num  = player_num
      @player_color = player_color
    end

  end
end