module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
      @alert_view = nil
    end

    def reset_match
      @menu_click_sound.play(0.7, 1, false)
      @game_state_model::state = :active
      @game_state_model::grid.reset
      @game_state_model::player_turn_state = 0
      @view::control.build_red_grid
      alert_close
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
      else
      @game_state_model::game_mode_logic.check_for_winner
        if @game_state_model::state == :win
          @game_won = true
          @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::winner-1].player_color)
          @game_state_model::players[@game_state_model::winner-1].win
        end  
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
      delay = 0.25
      if ((@game_state_model::game_mode == :pvai) and (@game_state_model::player_turn_state == 1))
        delay = 2.0
      end

      player_turn = @game_state_model::player_turn_state
      @game_state_model.toggle_player_turn_state
      @view::grid.animate_tile_drop(x, @game_state_model::players[player_turn].player_color, delay){@game_state_model::grid.add_tile(x, player_turn)}
      if ((@game_state_model::game_mode == :pvai) and (@game_state_model::player_turn_state == 1))
        control_button_click(@game_state_model::ai.choose_location)
      end
      @view::control.check_available
    end

    def skip_button_click
      @game_state_model.toggle_player_turn_state
      @menu_click_sound.play(0.7, 1, false)
    end

    def concede_button_click
      @game_won = true
      @game_state_model.toggle_player_turn_state
      @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::player_turn_state].player_color)
      @game_state_model::players[@game_state_model::player_turn_state].win
      @menu_click_sound.play(0.7, 1, false)
    end

    def reset_button_click
      @game_state_model::grid.reset
      @view::control.build_red_grid
    end

    def question_button_click
      @alert_view = @help_view = Views::HelpAlertView.new(@window, self)
      @menu_click_sound.play(0.7, 1, false)
    end

    def alert_close
      @menu_click_sound.play(0.7, 1, false)
      @alert_view = nil
    end

    def cancel_button_click
      @window.close
    end

  end
end