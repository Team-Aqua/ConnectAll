module Views
  class GameFooterView
    def initialize(window, game_state_model)
      @window = window
      @game_state_model = game_state_model

      @status_buttons = Array.new
      @skip = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_skip.png", :tileable => true), 169, 470 + 50, 1, lambda { @window.shift_team }, Gosu::Image.new("assets/images/btn_skip_click.png", false))
      @concede = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_concede.png", :tileable => true), 169, 470 + 10, 1, lambda { @window.reset }, Gosu::Image.new("assets/images/btn_concede_click.png", :tileable => true))
      @status_buttons << @skip
      @status_buttons << @concede
    end

    def draw
      @status_buttons.each do |i|
        i.draw
      end
    end
  end
end