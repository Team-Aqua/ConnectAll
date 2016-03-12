module Views
  class ModeMenuView
    def initialize(window, controller)
      @window = window
      @controller = controller
      @button_width = 235

      @buttonPvAi = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_ai.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { @controller.pvai_button_click }, Gosu::Image.new("assets/images/btn_play_ai_click.png"))
      @buttonPvP = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_player.png"), (@window.width/2)-(@button_width/2), 200, 100, lambda { @controller.pvp_button_click }, Gosu::Image.new("assets/images/btn_play_player_click.png"))


    end

    def draw
      @buttonPvAi.draw
      @buttonPvP.draw
    end

    def update
      @buttonPvAi.update
      @buttonPvP.update
    end

    def clicked
      @buttonPvAi.clicked
      @buttonPvP.clicked
    end

  end
end