module Views
  class PlayerMenuView
    attr_accessor :color_swap

    def initialize(window, controller, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @controller = controller
      @button_width = 235

      @menu_click_sound = Gosu::Sample.new(@window, "assets/sounds/menu_click.mp3")
      @ole_start = Gosu::Sample.new(@window, "assets/sounds/ole_start.mp3")
      @color_selection = 0
      @color2_selection = 0
      @color_selection_wheel = ['green','orange','pink','white']
      @color2_selection_wheel = ['teal','yellow','black','purple']
      
      @player_buttons ={
        'orange' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_orange.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_orange_click.png")),
        'pink' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_pink.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_pink_click.png")),
        'white' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_white.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_white_click.png")),
        'green' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_green.png"), (@window.width/2)-(@button_width/2), 125, 100, lambda { color_swap }, Gosu::Image.new("assets/images/header_player_nocolon_green_click.png"))
      }
      @player2_buttons = {
        'yellow' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_yellow.png"), (@window.width/2)-(@button_width/2), 185, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_yellow_click.png")),
        'teal' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_teal.png"), (@window.width/2)-(@button_width/2), 185, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_teal_click.png")),
        'black' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_black.png"), (@window.width/2)-(@button_width/2), 185, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_black_click.png")),
        'purple' => BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_nocolon_purple.png"), (@window.width/2)-(@button_width/2), 185, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_nocolon_purple_click.png"))
      }

      if (@game_state_model::game_mode == :pvp)
        @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
        @button_player2 = @player2_buttons[@color2_selection_wheel[@color2_selection]]
        @button_rdy = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_start.png"), 248, 245, 100, lambda { @ole_start.play(0.7, 1, false); @controller.player_rdy(@color_selection_wheel[@color_selection], player2_color: @color2_selection_wheel[@color2_selection]) }, Gosu::Image.new("assets/images/btn_start_click.png"))  
      else
        @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
        #Added to reduce logic complexity in draw and update. SHould be out of view tho
        @button_player2 = BtnItem.new(@window, Gosu::Image.new("assets/images/header_player_black.png"), -500, -500, 100, lambda { color2_swap }, Gosu::Image.new("assets/images/header_player_black_click.png"))
        @button_rdy = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_start.png"), 248, 185, 100, lambda { @ole_start.play(0.7, 1, false); @controller.player_rdy(@color_selection_wheel[@color_selection]) }, Gosu::Image.new("assets/images/btn_start_click.png"))  
      end      

    end

    def color_swap
      @color_selection = (@color_selection + 1) % @color_selection_wheel.count
      @button_player = @player_buttons[@color_selection_wheel[@color_selection]]
    end

    def color2_swap
      @color2_selection = (@color2_selection + 1) % @color2_selection_wheel.count
      @button_player2 = @player2_buttons[@color2_selection_wheel[@color2_selection]]
    end

    def draw
      @button_player.draw
      @button_player2.draw
      @button_rdy.draw
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