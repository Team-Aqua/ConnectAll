module Views
  class TypeMenuView
    def initialize(window, controller)
      @window = window
      @controller = controller
      @button_width = 235

      @buttonClassic = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_classic.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { @controller.classic_button_click }, Gosu::Image.new("assets/images/btn_classic_click.png"))
      @buttonOtto = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_otto.png"), (@window.width/2)-(@button_width/2), 200, 100, lambda { @controller.otto_button_click }, Gosu::Image.new("assets/images/btn_otto_click.png"))

      @questionOtto = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question.png"), 125, 10, 110, lambda { @controller.question_otto_button_click }, Gosu::Image.new("assets/images/btn_question_click.png"))
      @questionClassic = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question_light.png"), 125, 70, 110, lambda { @controller.question_classic_button_click }, Gosu::Image.new("assets/images/btn_question_light_click.png"))

      @helpOtto = Gosu::Image.new("assets/images/item_otto_mode.png", :tileable => false)
      @helpClassic = Gosu::Image.new("assets/images/item_what_is_classic_mode.png", :tileable => false)

      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
    end

    def draw
      @buttonClassic.draw
      @buttonOtto.draw
      @questionOtto.draw
      @questionClassic.draw
    end

    def update
      @buttonClassic.update
      @buttonOtto.update
      @questionOtto.update
      @questionClassic.update
    end

    def clicked
      @menu_click_sound.play
      @buttonClassic.clicked
      @buttonOtto.clicked
      @questionOtto.clicked
      @questionClassic.clicked
    end

  end
end