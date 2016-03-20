module Views
  class PlayerMenuView
    attr_accessor :color_swap

    def initialize(window, controller, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @controller = controller
      @button_width = 235
      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Light.ttf", 36)

      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
      #@ole_start = Gosu::Sample.new(@window, "assets/sounds/ole_start.mp3")
      @color_selection = 0
      @color2_selection = 0
      @color_selection_wheel = ['green','orange','pink','white']
      @color2_selection_wheel = ['teal','yellow','black','purple']
      
      @player_buttons ={
        'orange' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_orange.png"), (@window.width/2)-(@button_width/2) - 125, 115, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_orange_click.png")),
        'pink' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_pink.png"), (@window.width/2)-(@button_width/2) - 125, 115, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_pink_click.png")),
        'white' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_white.png"), (@window.width/2)-(@button_width/2) - 125, 115, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_white_click.png")),
        'green' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_green.png"), (@window.width/2)-(@button_width/2) - 125, 115, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_green_click.png"))
      }
      @player_name = {
        'orange' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_orange_name.png"), (@window.width/2)-(@button_width/2) - 125, 185, 100, lambda { color_swap }),
        'pink' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_pink_name.png"), (@window.width/2)-(@button_width/2) - 125, 185, 100, lambda { color_swap }),
        'white' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_white_name.png"), (@window.width/2)-(@button_width/2) - 125, 185, 100, lambda { color_swap }),
        'green' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_green_name.png"), (@window.width/2)-(@button_width/2) - 125, 185, 100, lambda { color_swap })
      }
      @player2_buttons = {
        'yellow' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_yellow.png"), (@window.width/2)-(@button_width/2) - 125, 225, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_yellow_click.png")),
        'teal' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_teal.png"), (@window.width/2)-(@button_width/2) - 125, 225, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_teal_click.png")),
        'black' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_black.png"), (@window.width/2)-(@button_width/2) - 125, 225, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_black_click.png")),
        'purple' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_purple.png"), (@window.width/2)-(@button_width/2) - 125, 225, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_purple_click.png"))
      }
      @player2_name = {
        'yellow' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_yellow_name.png"), (@window.width/2)-(@button_width/2) - 125, 295, 100, lambda { color_swap }),
        'teal' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_teal_name.png"), (@window.width/2)-(@button_width/2) - 125, 295, 100, lambda { color_swap }),
        'black' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_black_name.png"), (@window.width/2)-(@button_width/2) - 125, 295, 100, lambda { color_swap }),
        'purple' => BtnItem.new(@window, Gosu::Image.new("assets/images/input_purple_name.png"), (@window.width/2)-(@button_width/2) - 125, 295, 100, lambda { color_swap })
      }

      if (@game_state_model::game_mode == :pvp)
        @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
        @button_player2 = @player2_buttons[@color2_selection_wheel[@color2_selection]]
        @name_player = @player_name[@color_selection_wheel[@color_selection]]
        @name_player2 = @player2_name[@color2_selection_wheel[@color2_selection]]
        @text_fields = Array.new(2) { |index| TextField.new(@window, @font, 113, 175 + index * 110, "Player #{index + 1}") }
        @button_rdy = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_start.png"), 382, 275, 100, lambda { @controller.player_rdy(@color_selection_wheel[@color_selection], player2_color: @color2_selection_wheel[@color2_selection], player1_name: @text_fields[0].get_text, player2_name: @text_fields[1].get_text) }, Gosu::Image.new("assets/images/btn_start_click.png"))  
      else
        @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
        @name_player = @player_name[@color_selection_wheel[@color_selection]]
        #Added to reduce logic complexity in draw and update. SHould be out of view tho
        @text_fields = Array.new(1) { |index| TextField.new(@window, @font, 113, 175, "Player #{index + 1}") }
        @button_player2 = BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_black.png"), -500, -500, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_black_click.png"))        
        @name_player2 = BtnItem.new(@window, Gosu::Image.new("assets/images/input_black_name.png"), -500, -500, 100, lambda { color_swap })
        @button_rdy = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_start.png"), 382, 275, 100, lambda { @ole_start.play(0.7, 1, false); @controller.player_rdy(@color_selection_wheel[@color_selection], player1_name: @text_fields[0].get_text)}, Gosu::Image.new("assets/images/btn_start_click.png"))  
      end    

    end

    def button_down(id)
      if id == Gosu::KbTab then
        # Tab key will not be 'eaten' by text fields; use for switching through
        # text fields.
        index = @text_fields.index(@window.text_input) || -1
        @window.text_input = @text_fields[(index + 1) % @text_fields.size]

      elsif id == Gosu::KbEscape then
        # Escape key will not be 'eaten' by text fields; use for deselecting.
        if @window.text_input then
          @window.text_input = nil
        else
          close
        end

      elsif id == Gosu::MsLeft then
        # Mouse click: Select text field based on mouse position.
        @window.text_input = @text_fields.find { |tf| tf.under_point?(@window.mouse_x, @window.mouse_y) }
        # Advanced: Move caret to clicked position
        @window.text_input.move_caret(@window.mouse_x) unless @window.text_input.nil?
      end
    end

    def color_swap
      @color_selection = (@color_selection + 1) % @color_selection_wheel.count
      @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
      @name_player = @player_name[@color_selection_wheel[@color_selection]]
    end

    def color2_swap
      @color2_selection = (@color2_selection + 1) % @color2_selection_wheel.count
      @button_player2 = @player2_buttons[@color2_selection_wheel[@color2_selection]]
      @name_player2 = @player2_name[@color2_selection_wheel[@color2_selection]]
    end

    def draw
      @button_player.draw
      @button_player2.draw
      @name_player.draw
      @name_player2.draw
      @button_rdy.draw
      @text_fields.each { |tf| tf.draw }
    end

    def update
      @button_player.update
      @button_player2.update
      @button_rdy.update
    end

    def clicked
      @menu_click_sound.play
      @button_player.clicked
      @button_player2.clicked
      @button_rdy.clicked
    end

  end
end