module Views
  class CascadingAlertView < AlertView
    attr_reader :y_anchor_pos
    ##
    # Generic AlertView implementation
    # Used as framework for other alertviews

    def initialize(window, controller)
      super(window, controller)
      @y_anchor_pos = -505
      @anchor_reached = false
    end

    def slide_view
      if @y_anchor_pos < 0
        @y_anchor_pos += 10
      else
        @anchor_reached = true
      end
    end

  end
end