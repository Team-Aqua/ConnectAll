class Header
  def initialize(window)
    @window = window
    @header_green = Gosu::Image.new("assets/images/header_green.png")
    @header_purple = Gosu::Image.new("assets/images/header_purple.png")
    @block_purple = Gosu::Image.new("assets/images/block_purple.png")
    @block_green = Gosu::Image.new("assets/images/block_green.png")
    @font = Gosu::Font.new(@window, "assets/fonts/Roboto-Bold.ttf", 20)
    @question = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_question_light.png"), 295, 10, 1, lambda { help_this }, Gosu::Image.new("assets/images/btn_question_light_click.png"))
    @help = Gosu::Image.new("assets/images/item_how_to_play.png", :tileable => false)
    @cancel = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_light.png"), 315, 10, 1, lambda { @window.close }, Gosu::Image.new("assets/images/btn_cancel_light_click.png", :tileable => false))
    @cancel_dark = BtnItem.new(@window, Gosu::Image.new("assets/images/btn_cancel_dark.png"), 285, 20, 110, lambda { stop_help }, Gosu::Image.new("assets/images/btn_cancel_dark_click.png", :tileable => false))
    @ico_two = Gosu::Image.new("assets/images/ico_2.png")
    @ico_one = Gosu::Image.new("assets/images/ico_1.png")
    @x = @y = 0.0
    @state = 0
    @help_state = 0
  end

  def place(x, y)
    @x, @y = x, y
  end

  def help_this
    @help_state = 1
  end

  def stop_help
    @help_state = 0
  end

  def shift_team
    if @state == 0
      @state = 1 
    else 
      @state = 0
    end
  end

  def draw
    if @help_state == 1
      @cancel_dark.draw
      @help.draw(10, 10, 100)
    end
    if @state == 0
      @header_green.draw(@x, @y, 1)
      @ico_two.draw(@x + 128, @y + 20, 500)
    else 
      @header_purple.draw(@x, @y, 1)
      @ico_one.draw(@x + 128, @y + 20, 500)
    end
    @block_purple.draw(@x + 10, @y + 5, 1)
    @block_green.draw(@x + 10, @y + 45, 1)
    @question.draw
    @cancel.draw
    @font.draw("UserOne", 50, @y + 2, 2, 1.0, 1.0, 0xff_ffffff)
    @font.draw("Wins: 0", 50, @y + 17, 2, 1.0, 1.0, 0xff_ffffff)
    @font.draw("UserTwo", 50, @y + 42, 2, 1.0, 1.0, 0xff_ffffff)
    @font.draw("Wins: 1", 50, @y + 57, 2, 1.0, 1.0, 0xff_ffffff)
  end

  def update
    @cancel.update
    @question.update
    @cancel_dark.update
  end

  def clicked
    @cancel_dark.clicked
    @cancel.clicked
    @question.clicked
  end
end