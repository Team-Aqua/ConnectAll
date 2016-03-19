require 'gosu'
class TextField < Gosu::TextInput
  # Some constants that define our appearance.
  INACTIVE_COLOR  = 0xcc666666
  ACTIVE_COLOR    = 0xccff6666
  SELECTION_COLOR = 0xcc0000ff
  CARET_COLOR     = 0xff505050
  PADDING_X = 10
  PADDING_Y = -3
  attr_reader :x, :y

  def initialize(window, font, x, y, ip_text)
    # TextInput's constructor doesn't expect any arguments.
    super()
    @window, @font, @x, @y, self.text = window, font, x, y, ip_text
    @box = Gosu::Image.new("assets/images/ip_name.png", :tileable => false)
    @box_hover = Gosu::Image.new("assets/images/ip_name_hover.png", :tileable => false)
    @drawbox
    @width = 153
    @height = 33
    @caret_height = 25
  end

  # Example filter method. You can truncate the text to employ a length limit (watch out
  # with Ruby 1.8 and UTF-8!), limit the text to certain characters etc.
  def filter text
    if width + @font.text_width(text) < 140
      return text.gsub(/[^A-Z0-9a-z ]/, '')
    else 
      return nil
    end
    # text.upcase
  end

  def get_text
    return self.text
  end

  def draw
    # Depending on whether this is the currently selected input or not, change the
    # background's color.
    if @window.text_input == self then
      @drawbox = @box  
    else
      @drawbox = @box_hover
    end
    # @window.draw_quad(x - PADDING,         y - PADDING,          background_color,
    #                  x + width + PADDING, y - PADDING,          background_color,
    #                  x - PADDING,         y + height + PADDING, background_color,
    #                  x + width + PADDING, y + height + PADDING, background_color, 100)
    # Calculate the position of the caret and the selection start.
    @drawbox.draw(x - PADDING_X, y - PADDING_Y, 100)
    pos_x = x + @font.text_width(self.text[0...self.caret_pos])
    sel_x = x + @font.text_width(self.text[0...self.selection_start])
    # Draw the selection background, if any; if not, sel_x and pos_x will be
    # the same value, making this quad empty.
    # @window.draw_quad(sel_x, y,          SELECTION_COLOR,
    #                  pos_x, y,          SELECTION_COLOR,
    #                  sel_x, y + height, SELECTION_COLOR,
    #                  pos_x, y + height, SELECTION_COLOR, 100)
    
    # Draw the caret; again, only if this is the currently selected field.
    if @window.text_input == self then
      @window.draw_line(pos_x, y - PADDING_Y + 5,          CARET_COLOR,
                        pos_x, y + height - PADDING_Y - 5, CARET_COLOR, 100)
    end
    # Finally, draw the text itself!
    @font.draw(self.text, x, y, 120, 1, 1, 0xff_585858)
  end

  # This text field grows with the text that's being entered.
  # (Usually one would use clip_to and scroll around on the text field.)
  def width
    @font.text_width(self.text)
  end

  def height
    @font.height
  end

  # Hit-test for selecting a text field with the mouse.
  def under_point?(mouse_x, mouse_y)
    mouse_x > x - PADDING_X and mouse_x < x + @width + PADDING_X and
      mouse_y > y - PADDING_Y and mouse_y < y + @height + PADDING_Y
  end

  # Tries to move the caret to the position specifies by mouse_x
  def move_caret(mouse_x)
    # Test character by character
    1.upto(self.text.length) do |i|
      if mouse_x < x + @font.text_width(text[0...i]) then
        self.caret_pos = self.selection_start = i - 1;
        return
      end
    end
    # Default case: user must have clicked the right edge
    self.caret_pos = self.selection_start = self.text.length
  end
end