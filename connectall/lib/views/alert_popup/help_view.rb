module Views
  class HelpAlertView

    def initialize(window, controller)
      @window = window
      @controller = controller
      @help = Gosu::Image.new("assets/images/item_how_to_play.png", :tileable => false)
      @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_dark.png"), 300, 15, 100, lambda { @controller.alert_close }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
    end

    def draw
      @help.draw(30, 10, 100)
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