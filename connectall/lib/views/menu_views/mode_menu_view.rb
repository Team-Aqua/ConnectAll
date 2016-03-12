module Views
  class ModeMenuView
    def initialize(window, controller)
      @window = window
      @controller = controller
      @button_width = 235

      @buttonPvP = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_player.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { @controller.pvp_button_click }, Gosu::Image.new("assets/images/btn_play_player_click.png"))
      @buttonPvAi = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_ai.png"), (@window.width/2)-(@button_width/2), 195, 100, lambda { @controller.pvai_button_click }, Gosu::Image.new("assets/images/btn_play_ai_click.png"))

      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
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
      @menu_click_sound.play(0.7, 1, false)
      @buttonPvAi.clicked
      @buttonPvP.clicked
    end

  end
end