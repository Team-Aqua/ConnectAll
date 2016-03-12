module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
      @alert_view = nil
      @game_won = false
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
      @game_state_model::game_mode_logic.check_for_winner
      if @game_state_model::state == :win and @game_won == false
        @game_won = true
        @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::winner-1].player_color)
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
      player_turn = @game_state_model::player_turn_state
      @game_state_model.toggle_player_turn_state
      @view::grid.animate_tile_drop(x, @game_state_model::players[player_turn].player_color){@game_state_model::grid.add_tile(x, player_turn)}
      

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
      @game_state_model::grid.reset
      @game_state_model::state = :active
      @alert_view = nil
    end

    def cancel_button_click
      @window.close
    end

  end
end