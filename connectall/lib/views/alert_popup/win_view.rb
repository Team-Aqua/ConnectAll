module Views
  class WinAlertView

    def initialize(window, controller, player_color)
      @window = window
      @controller = controller

      @player_win_views ={
        'orange' => Gosu::Image.new("assets/images/header_orange_win.png", :tileable => false),
        'pink' => Gosu::Image.new("assets/images/header_pink_win.png", :tileable => false),
        'white' => Gosu::Image.new("assets/images/header_white_win.png", :tileable => false),
        'green' => Gosu::Image.new("assets/images/header_green_win.png", :tileable => false),
        'yellow' => Gosu::Image.new("assets/images/header_yellow_win.png", :tileable => false),
        'teal' => Gosu::Image.new("assets/images/header_teal_win.png", :tileable => false),
        'black' => Gosu::Image.new("assets/images/header_black_win.png", :tileable => false),
        'purple' => Gosu::Image.new("assets/images/header_purple_win.png", :tileable => false)
      }

      @view = @player_win_views[player_color]
      # @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel.png"), 310, 20, 200, lambda { @controller.alert_close }, Gosu::Image.new("assets/images/btn_cancel.png", :tileable => false))
      @replay = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_replay.png"), 185, 445, 200, lambda { @controller.reset_match }, Gosu::Image.new("assets/images/btn_replay_click.png", :tileable => false))
      @return = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_return_sm.png"), 185, 485, 200, lambda { @window.start_menu }, Gosu::Image.new("assets/images/btn_return_sm_click.png", :tileable => false))
    end

    def draw
      @view.draw(0, 0, 100)
      @replay.draw
      @return.draw
    end
    
    def update
      @replay.update
      @return.update
    end
    
    def clicked
      @replay.clicked
      @return.clicked
    end

  end
end