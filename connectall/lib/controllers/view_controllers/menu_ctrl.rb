module Controllers
  class MenuCtrl
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @menu_background = Views::MenuView.new(@window, self)
      @views = [Views::TypeMenuView.new(@window, self), Views::ModeMenuView.new(@window, self)]
      @current_view = @views.first
      @alert_view = nil
    end

    def draw
      @menu_background.draw
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

    def player_rdy(color, player2_color: nil)
      @game_state_model::players.push(Models::RealPlayer.new(1, color))
      if player2_color != nil
        @game_state_model::players.push(Models::RealPlayer.new(2, player2_color))
      else
        if @game_state_model::game_type = :classic
          @game_state_model::players.push(Models::AIPlayer.new(2, 'black', GameLogic::ClassicAI.new(@game_state_model)))
        else
          @game_state_model::players.push(Models::AIPlayer.new(2, 'black', GameLogic::OttoAI.new(@game_state_model)))
        end
      end
      @window.start_game
    end

    def pvp_button_click
      @game_state_model::game_mode = :pvp
      @game_state_model::num_of_players = 2
      @current_view = Views::PlayerMenuView.new(@window, self, @game_state_model)
    end

    def pvai_button_click
      @game_state_model::game_mode = :pvai
      @game_state_model::num_of_players = 1
      @current_view = Views::PlayerMenuView.new(@window, self, @game_state_model)
    end

    def classic_button_click
      @game_state_model::game_type = :classic
      @game_state_model::game_mode_logic = GameLogic::ClassicRules.new(@game_state_model)
      @current_view = @views[1]
    end
    
    def otto_button_click
      @game_state_model::game_type = :otto
      @game_state_model::game_mode_logic = GameLogic::OttoRules.new(@game_state_model)
      @current_view = @views[1]
    end
    
    def question_otto_button_click
      @alert_view = @help_view = Views::OttoInstructionsAlertView.new(@window, self)
    end

    def question_help_click
      @alert_view = @help_view = Views::ConnectAllAlertView.new(@window, self)
    end

    def question_classic_button_click
      @alert_view = @help_view = Views::ConnectInstructionsAlertView.new(@window, self)
    end

    def alert_close
      @alert_view = nil
    end

  end
end