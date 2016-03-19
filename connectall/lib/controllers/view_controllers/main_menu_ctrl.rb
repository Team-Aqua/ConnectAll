module Controllers
  class MenuCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @views = [Views::MenuView.new(@window, self), Views::ModeMenuView.new(@window, self)]
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

    def button_down(key)
    end

    def pvp_button_click
      @game_state_model::game_mode = :pvp
      @window.start_game
    end

    def pvai_button_click
      @game_state_model::game_type = :pvai
      @window.start_game
    end

    def classic_button_click
      @game_state_model::game_type = :classic
      @current_view = @views[1]
    end

    def otto_button_click
      @game_state_model::game_type = :otto
      @current_view = @views[1]
    end

  end
end