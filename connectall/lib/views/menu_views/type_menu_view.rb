module Views
  class TypeMenuView
    def initialize(window, controller)
      @window = window
      @controller = controller
      @button_width = 235

      @buttonClassic = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_classic.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { @controller.classic_button_click }, Gosu::Image.new("assets/images/btn_classic_click.png"))
      @buttonOtto = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_otto.png"), (@window.width/2)-(@button_width/2), 200, 100, lambda { @controller.otto_button_click }, Gosu::Image.new("assets/images/btn_otto_click.png"))

      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
    end

    def draw
      @buttonClassic.draw
      @buttonOtto.draw
    end

    def update
      @buttonClassic.update
      @buttonOtto.update
    end

    def clicked
      @menu_click_sound.play
      @buttonClassic.clicked
      @buttonOtto.clicked
    end

  end
end