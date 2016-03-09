
module Controllers
  class GameCtrl
    def initialize(window, model)
      @window = window
      @model = model
      @view = Views::GameView.new(@window, self, @model)
    end

    def draw
      @view.draw
    end

    def update
      
    end
  end
end