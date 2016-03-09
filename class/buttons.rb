require_relative 'btnitem.rb'

class Buttons
  def initialize(window)
    @window = window
    @x = @y = 0.0
    @red_grid = Array.new
    original_pos = 29
    (1..8).each { |x|
      red_button = BtnItem.new(@window, Gosu::Image.new("assets/images/block_red.png", :tileable => true), original_pos, 420, 1, lambda { @window.update_grid(x) }, Gosu::Image.new("assets/images/block_red_click.png", false))
      @red_grid << red_button
      original_pos = original_pos + 35.5
    }
    @status_buttons = Array.new
    @skip = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_skip.png", :tileable => true), 169, 470 + 50, 1, lambda { @window.shift_team }, Gosu::Image.new("assets/images/btn_skip_click.png", false))
    @concede = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_concede.png", :tileable => true), 169, 470 + 10, 1, lambda { @window.reset }, Gosu::Image.new("assets/images/btn_concede_click.png", :tileable => true))
    @status_buttons << @skip
    @status_buttons << @concede

  end 

  def place(x, y)
    @x, @y = x, y
  end

  def draw
    @red_grid.each do |j|
      j.draw
    end
    @status_buttons.each do |i|
      i.draw
    end
  end

  def update
    @red_grid.each do |j|
      j.update
    end
    @status_buttons.each do |i|
      i.update
    end
  end

  def clicked
    @red_grid.each do |j|
      j.clicked
    end
    @status_buttons.each do |i|
      i.clicked
    end
  end

end