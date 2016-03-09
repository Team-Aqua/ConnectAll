module Views
  class GameView
    def initialize(window, controller, model)
      @window = window
      @controller = controller
      @model = model

      @grid = GridView.new(@window)
      @state = 0

      @image = Gosu::Image.new("assets/images/img_grid.png", :tileable => true)
      @background_image_green = Gosu::Image.new("assets/images/bg_green.png", :tileable => false)
      @background_image_purple = Gosu::Image.new("assets/images/bg_purple.png", :tileable => false)
    end

    def draw
      @grid.draw
      @image.draw(@x, @y, 1)
      if @state == 0
        @background_image_green.draw(0, 0, 0)
      else 
        @background_image_purple.draw(0, 0, 0)
      end
    end

    def update

    end
  end
end