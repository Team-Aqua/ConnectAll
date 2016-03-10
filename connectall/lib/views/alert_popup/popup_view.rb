module Views
  class AlertView

    def initialize(window, controller)
      @window = window
      @controller = controller
      # @help = Gosu::Image.new("assets/images/item_how_to_play.png", :tileable => false)
      # @cancel_dark = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_light.png"), 285, 20, 110, lambda { @controller.alert_close }, Gosu::Image.new("assets/images/btn_cancel_dark.png", :tileable => false))
    end

    def draw
      # @cancel_dark.draw
      # @help.draw(10, 10, 100)
    end
    
    def update
      # @cancel.update
    end
    
    def clicked
      # @cancel.clicked
    end

  end
end