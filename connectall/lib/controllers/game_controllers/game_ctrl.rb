module Controllers
  class GameCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @view = Views::GameView.new(@window, self, @game_state_model)
      @alert_view = nil
    end

    def reset_match
      # puts "clicked"
      # 
      @game_state_model::state = :active
      @game_state_model::grid.reset
      @game_state_model::player_turn_state = 0
    
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
          # puts "LOL IM STILL WORKING"
          @game_won = true
          @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::winner-1].player_color)
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
        delay = 0.5
      end

      player_turn = @game_state_model::player_turn_state
      @game_state_model.toggle_player_turn_state
      @view::grid.animate_tile_drop(x, @game_state_model::players[player_turn].player_color, delay){@game_state_model::grid.add_tile(x, player_turn)}


      if ((@game_state_model::game_mode == :pvai) and (@game_state_model::player_turn_state == 1))
        control_button_click(@game_state_model::ai.choose_location)
      end
    end

    def skip_button_click
      @game_state_model.toggle_player_turn_state
    end

    def concede_button_click
      @game_won = true
      @game_state_model.toggle_player_turn_state
      @alert_view = Views::WinAlertView.new(@window, self, @game_state_model::players[@game_state_model::player_turn_state].player_color)
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