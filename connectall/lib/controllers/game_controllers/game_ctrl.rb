module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
      @alert_view = nil

      @click_sound = Gosu::Sample.new(@window, "assets/sounds/quick_beat.mp3")
      @swoosh_sound = Gosu::Sample.new(@window, "assets/sounds/fast_swish.mp3")
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
      @swoosh_sound.play(0.7, 1, false)
      @game_state_model::grid.add_tile(x, @game_state_model::player_turn_state)
      @click_sound.play(0.7, 1, false)
      @game_state_model::game_mode_logic.check_for_winner
      if @game_state_model::state == :win
        @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::winner-1].player_color)
      end


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