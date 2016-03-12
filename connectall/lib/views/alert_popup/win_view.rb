module Views
  class WinAlertView

    def initialize(window, controller, player_color)
      @window = window
      @controller = controller


      @player_win_views ={
        'orange' => Gosu::Image.new("assets/images/header_orange_win.png", :tileable => false),
        'pink' => Gosu::Image.new("assets/images/header_pink_win.png", :tileable => false),
        'white' => Gosu::Image.new("assets/images/header_white_win.png", :tileable => false),
        #'green' => Gosu::Image.new("assets/images/header_green_win.png", :tileable => false),
        'yellow' => Gosu::Image.new("assets/images/header_yellow_win.png", :tileable => false),
        'teal' => Gosu::Image.new("assets/images/header_teal_win.png", :tileable => false),
        'black' => Gosu::Image.new("assets/images/header_black_win.png", :tileable => false)
        # 'purple' => Gosu::Image.new("assets/images/header_purple_win.png", :tileable => false)
      }

      @view = @player_win_views[player_color]
      @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_dark.png"), 290, 20, 100, lambda { @controller.alert_close }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
    end

    def draw
      @view.draw(0, 0, 100)
      @cancel.draw
    end
    
    def update
      @cancel.update
    end
    
    def clicked
      @cancel.clicked
    end

  end
end