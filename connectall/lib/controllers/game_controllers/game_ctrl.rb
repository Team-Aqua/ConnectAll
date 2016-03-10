module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
    end

    def draw
      @view.draw
    end

    def update
      
    end
  end
end