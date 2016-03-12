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
      @headers = {'green' => Gosu::Image.new("assets/images/header_green.png"),
                  'yellow' => Gosu::Image.new("assets/images/header_yellow.png"),
                  'orange' => Gosu::Image.new("assets/images/header_orange.png"),
                  'pink' => Gosu::Image.new("assets/images/header_pink.png"),
                  'teal' => Gosu::Image.new("assets/images/header_teal.png"),
                  'purple' => Gosu::Image.new("assets/images/header_purple.png"),
                  'white' => Gosu::Image.new("assets/images/header_white.png"),
                  'black' => Gosu::Image.new("assets/images/header_black.png")}

      @tiles = { 'green' => Gosu::Image.new("assets/images/block_green.png"),
          'yellow' => Gosu::Image.new("assets/images/block_yellow.png"),
          'pink' => Gosu::Image.new("assets/images/block_pink.png"),
          'teal' => Gosu::Image.new("assets/images/block_teal.png"),
          'orange' => Gosu::Image.new("assets/images/block_orange.png"),
          'white' => Gosu::Image.new("assets/images/block_white.png"),
          'black' => Gosu::Image.new("assets/images/block_black.png"),
          'grey' => Gosu::Image.new("assets/images/block_grey.png"),
          'purple' => Gosu::Image.new("assets/images/block_purple.png") }

      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)
      @question = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question_light.png"), 295, 10, 35, lambda { @controller.question_button_click }, Gosu::Image.new("assets/images/btn_question_light_click.png"))
      @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_light.png"), 315, 10, 35, lambda { @controller.cancel_button_click }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
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
      @headers[@game_state_model::players[@game_state_model.player_turn_state]::player_color].draw(@x, @y, 35)

      if @game_state_model.player_turn_state == 0
        @ico_one.draw(@x + 153, @y + 20, 35)
      else 
        @ico_two.draw(@x + 153, @y + 20, 35)
      end

      @tiles[@game_state_model::players[0]::player_color].draw(@x + 10, @y + 5, 35)
      @tiles[@game_state_model::players[1]::player_color].draw(@x + 10, @y + 45, 35)
      # @block_purple.draw(@x + 10, @y + 5, 1)
      # @block_green.draw(@x + 10, @y + 45, 1)
      @question.draw
      @cancel.draw
      @font.draw("UserOne", 50, @y + 2, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: 0", 50, @y + 17, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("UserTwo", 50, @y + 42, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: 1", 50, @y + 57, 35, 1.0, 1.0, 0xff_ffffff)
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