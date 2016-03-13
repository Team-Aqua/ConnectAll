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

       @tilesClassic = { 'green' => Gosu::Image.new("assets/images/block_green.png"),
                'yellow' => Gosu::Image.new("assets/images/block_yellow.png"),
                'pink' => Gosu::Image.new("assets/images/block_pink.png"),
                'teal' => Gosu::Image.new("assets/images/block_teal.png"),
                'orange' => Gosu::Image.new("assets/images/block_orange.png"),
                'white' => Gosu::Image.new("assets/images/block_white.png"),
                'black' => Gosu::Image.new("assets/images/block_black.png"),
                'grey' => Gosu::Image.new("assets/images/block_grey.png"),
                'purple' => Gosu::Image.new("assets/images/block_purple.png") }

      @tilesOtto = { 'green' => Gosu::Image.new("assets/images/block_green_o.png"),
                'yellow' => Gosu::Image.new("assets/images/block_yellow_o.png"),
                'pink' => Gosu::Image.new("assets/images/block_pink_t.png"),
                'teal' => Gosu::Image.new("assets/images/block_teal_o.png"),
                'orange' => Gosu::Image.new("assets/images/block_orange_t.png"),
                'white' => Gosu::Image.new("assets/images/block_white_t.png"),
                'black' => Gosu::Image.new("assets/images/block_black_o.png"),
                'grey' => Gosu::Image.new("assets/images/block_grey.png"),
                'purple' => Gosu::Image.new("assets/images/block_purple_t.png") }
      
      @tiles = @tilesClassic

      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)
      @question = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question_light.png"), 295, 10, 35, lambda { @controller.question_button_click }, Gosu::Image.new("assets/images/btn_question_light_click.png"))
      @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_light.png"), 315, 10, 35, lambda { @window.start_menu }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
      @ico_two = Gosu::Image.new("assets/images/ico_2.png")
      @ico_one = Gosu::Image.new("assets/images/ico_1.png")
      @x = @y = 0.0
      @state = 0
      @help_state = 0

      @help = Gosu::Image.new("assets/images/item_how_to_play.png", :tileable => false)
      @cancel_dark = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_dark.png"), 285, 20, 110, lambda { stop_help }, Gosu::Image.new("assets/images/btn_cancel_dark_click.png", :tileable => false))
    
      set_tiles

    end

    def set_tiles
      if @game_state_model::game_type == :classic
        @tiles = @tilesClassic
      elsif @game_state_model::game_type == :otto
        @tiles = @tilesOtto
      else 
        # raise "Error: bad game mode selected"
        # can't raise error - crashes on startup
      end
    end

    def draw
      # if @help_state == 1
      #   @cancel_dark.draw
      #   @help.draw(10, 10, 100)
      # end
      @headers[@game_state_model::players[@game_state_model.player_turn_state]::player_color].draw(@x, @y, 35)

      if @game_state_model.player_turn_state == 0
        @ico_one.draw(@x + 143, @y + 20, 35)
      else 
        @ico_two.draw(@x + 143, @y + 20, 35)
      end

      @tiles[@game_state_model::players[0]::player_color].draw(@x + 10, @y + 8, 35)
      @tiles[@game_state_model::players[1]::player_color].draw(@x + 10, @y + 48, 35)
      # @block_purple.draw(@x + 10, @y + 5, 1)
      # @block_green.draw(@x + 10, @y + 45, 1)
      @question.draw
      @cancel.draw
      @font.draw("Player One", 50, @y + 7, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: #{@game_state_model::players[0]::score}", 50, @y + 22, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Player Two", 50, @y + 47, 35, 1.0, 1.0, 0xff_ffffff)
      @font.draw("Wins: #{@game_state_model::players[1]::score}", 50, @y + 62, 35, 1.0, 1.0, 0xff_ffffff)
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