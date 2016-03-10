module Views
  class GameHeaderView
    def initialize(window, controller, game_state_model)
      @window = window
      @controller = controller
      @game_state_model = game_state_model
      @grid_xpos = 50
      @grid_ypos = 116
      
      @header_green = Gosu::Image.new("assets/images/header_green.png")
      @header_purple = Gosu::Image.new("assets/images/header_purple.png")
      @block_purple = Gosu::Image.new("assets/images/block_purple.png")
      @block_green = Gosu::Image.new("assets/images/block_green.png")
      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)
      @question = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question_light.png"), 295, 10, 1, lambda { @controller.question_button_click }, Gosu::Image.new("assets/images/btn_question_light_click.png"))
      @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_light.png"), 315, 10, 1, lambda { @controller.cancel_button_click }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
      @ico_two = Gosu::Image.new("assets/images/ico_2.png")
      @ico_one = Gosu::Image.new("assets/images/ico_1.png")
      @x = @y = 0.0
      @state = 0
      @help_state = 0

      @help = Gosu::Image.new("assets/images/item_how_to_play.png", :tileable => false)
      @cancel_dark = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_dark.png"), 285, 20, 110, lambda { stop_help }, Gosu::Image.new("assets/images/btn_cancel_dark_click.png", :tileable => false))
    end

    def draw
      # if @help_state == 1
      #   @cancel_dark.draw
      #   @help.draw(10, 10, 100)
      # end
      if @game_state_model.player_turn_state == 0
        @header_green.draw(@x, @y, 1)
        @ico_two.draw(@x + 153, @y + 20, 1)
      else 
        @header_purple.draw(@x, @y, 1)
        @ico_one.draw(@x + 153, @y + 20, 1)
      end

      @block_purple.draw(@x + 10, @y + 5, 1)
      @block_green.draw(@x + 10, @y + 45, 1)
      @question.draw
      @cancel.draw
      @font.draw("UserOne", 50, @y + 2, 2, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: 0", 50, @y + 17, 2, 1.0, 1.0, 0xff_ffffff)
      @font.draw("UserTwo", 50, @y + 42, 2, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: 1", 50, @y + 57, 2, 1.0, 1.0, 0xff_ffffff)
    end

    def update
      @question.update
      @cancel.update
    end

    def clicked
      @question.clicked
      @cancel.clicked
    end


  end
end