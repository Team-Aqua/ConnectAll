module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
      @alert_view = nil
    end

    def draw
      @view.draw
      if @alert_view != nil
        @alert_view.draw
      end
    end

    def update
      @view.update
      if @alert_view != nil
        @alert_view.update
      end
    end

    def clicked
      if @alert_view != nil
        @alert_view.clicked
      else
        @view.clicked
      end
    end

    def control_button_click(x)
      @game_state_model::grid.add_tile(x, @game_state_model::player_turn_state)
      #RUN GAME MODE LOGIC -> SHOULD MODIFY GAME_STATE_MODEL
      #CHECK GAME_STATE_MODEL FOR GAME STATE (WIN LOSE DRAW ACTIVE ... )
      #SET ALERT BASED ON GAMESTATE
      @game_state_model.toggle_player_turn_state
    end

    def skip_button_click
      @game_state_model.toggle_player_turn_state
    end

    def reset_button_click
      @game_state_model::grid.reset
    end

    def question_button_click
      @alert_view = @help_view = Views::HelpAlertView.new(@window, self)
    end

    def alert_close
      @alert_view = nil
    end

    def cancel_button_click
      @window.close
    end

  end
end