module Views
  class MainMenuView
    def initialize(window, controller)
      @window = window
      @controller = controller


      @question1 = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_ai.png"), 50, 300, 100, lambda { @controller.pvp_button_click }, Gosu::Image.new("assets/images/btn_play_ai.png"))
      @question = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_play_player.png"), 50, 150, 100, lambda { @controller.pvp_button_click }, Gosu::Image.new("assets/images/btn_play_player.png"))


    end

    def draw
      @question1.draw
      @question.draw
    end

    def update
      @question1.update
      @question.update
    end

    def clicked
      @question1.clicked
      @question.clicked
    end

  end
end