module Views
  class GameDropControlRowView
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model
      @grid_xpos = 50
      @grid_ypos = 116

      @x = @y = 0.0
      @red_grid = Array.new
      original_pos = 29
      (1..8).each { |x|
        red_button = BtnItem.new(@window, Gosu::Image.new("assets/images/block_red.png", :tileable => true), original_pos, 420, 1, lambda { @window.update_grid(x) }, Gosu::Image.new("assets/images/block_red_click.png", false))
        @red_grid << red_button
        original_pos = original_pos + 35.5
      }

    end

    def draw
      @red_grid.each do |j|
        j.draw
      end
    end
  end
end