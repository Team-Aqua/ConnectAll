module Views
  class GameView
    def initialize(window, controller, game_state_model)
      @window = window
      @controller = controller
      @game_state_model = game_state_model

      @grid = GridView.new(@window, @game_state_model.getGridModel)
      @control = GameDropControlRowView.new(@window, @game_state_model)
      @header = GameHeaderView.new(@window, @game_state_model)
      @footer = GameFooterView.new(@window, @game_state_model)
      @state = 0

      @image = Gosu::Image.new("assets/images/img_grid.png", :tileable => true)
      @background_image_green = Gosu::Image.new("assets/images/bg_green.png", :tileable => false)
      @background_image_purple = Gosu::Image.new("assets/images/bg_purple.png", :tileable => false)
      @x = 29.0
      @y = 116.0
    end

    def draw
      @header.draw
      @grid.draw
      @control.draw
      @footer.draw
      # @image.draw(@x, @y, 1)
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