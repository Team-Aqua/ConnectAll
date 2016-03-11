module Views
  class MenuView
    def initialize(window, controller)
      @window = window
      @controller = controller


      @header = Gosu::Image.new("assets/images/header_connectall.png", :tileable => true)
      @background = Gosu::Image.new("assets/images/bg_blue.png", :tileable => false)

      #@main_menu = 
      @mode_menu = Views::MainMenuView.new(@window, controller)

      @current_sub_menu = @mode_menu

      @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)

    end

    def draw
      @header.draw(0, 0, 10)
      @background.draw(0,0,9)
      @current_sub_menu.draw
    end

    def update
      @current_sub_menu.update
    end

    def clicked
      @current_sub_menu.clicked
    end

  end
end