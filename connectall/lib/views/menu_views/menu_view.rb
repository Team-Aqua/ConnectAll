module Views
  class MenuView
    def initialize(window, controller)
      @window = window
      @controller = controller

      @header = Gosu::Image.new("assets/images/header_connectall.png", :tileable => true)
      @background = Gosu::Image.new("assets/images/bg_blue.png", :tileable => false)
      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)

    end

    def draw
      @header.draw(0, 0, 10)
      @background.draw(0,0,9)
    end

    def button_down(key)
    end

    def update
    end

    def clicked
    end

  end
end