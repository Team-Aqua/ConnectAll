module Controllers
  class MainMenuCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @views = [Views::MenuView.new(@window, self)]
      @current_view = @views.first
      @alert_view = nil
    end

    def draw
      @current_view.draw
      if @alert_view != nil
        @alert_view.draw
      end
    end

    def update
      @current_view.update
      if @alert_view != nil
        @alert_view.update
      end
    end

    def clicked
      if @alert_view != nil
        @alert_view.clicked
      else
        @current_view.clicked
      end
    end

    def pvp_button_click
      @window.start_game
    end


  end
end