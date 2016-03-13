module Views
  class GameView
    attr_accessor :grid, :control
    def initialize(window, controller, game_state_model)
      @window = window
      @controller = controller
      @game_state_model = game_state_model

      @grid = GridView.new(@window, @controller, @game_state_model)
      @control = GameDropControlRowView.new(@window, @controller, @game_state_model)
      @header = GameHeaderView.new(@window, @controller, @game_state_model)
      @footer = GameFooterView.new(@window, @controller, @game_state_model)
      @sub_views = [@grid, @control, @header, @footer] 

      @state = 0

      @image = Gosu::Image.new("assets/images/img_grid.png", :tileable => true)

      @backgrounds = {'green' => Gosu::Image.new("assets/images/bg_nogrid_green.png", :tileable => false),
            'yellow' => Gosu::Image.new("assets/images/bg_nogrid_yellow.png", :tileable => false),
            'orange' => Gosu::Image.new("assets/images/bg_nogrid_orange.png", :tileable => false),
            'pink' => Gosu::Image.new("assets/images/bg_nogrid_pink.png", :tileable => false),
            'teal' => Gosu::Image.new("assets/images/bg_nogrid_teal.png", :tileable => false),
            'purple' => Gosu::Image.new("assets/images/bg_nogrid_purple.png", :tileable => false),
            'white' => Gosu::Image.new("assets/images/bg_nogrid_white.png", :tileable => false),
            'black' => Gosu::Image.new("assets/images/bg_nogrid_black.png", :tileable => false)}
      @grey_bg = Gosu::Image.new("assets/images/bg_grey.png", :tileable => false)
      @x = 29.0
      @y = 116.0
    end


    def draw
      @sub_views.each do |view|
        view.draw
      end
      @backgrounds[@game_state_model::players[@game_state_model.player_turn_state]::player_color].draw(0, 0, 25)
      @grey_bg.draw(0, 0, 0)
      # if @game_state_model.player_turn_state == 0
      #   @background_image_green.draw(0, 0, 0)
      # else 
      #   @background_image_purple.draw(0, 0, 0)
      # end
    end

    def update
      @sub_views.each do |view|
        view.update
      end
    end

    def clicked
      @sub_views.each do |view|
        view.clicked
      end
    end

  end
end