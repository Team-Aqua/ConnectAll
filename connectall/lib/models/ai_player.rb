module Models
  class AIPlayer < Player

    def initialize(player_num, player_color, ai)
      super(player_num, player_color)
      @ai = ai
    end
  end
end