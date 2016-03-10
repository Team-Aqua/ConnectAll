require 'gosu'

require_relative 'controllers/game_controllers/game_ctrl'

require_relative 'models/game_state_model'
require_relative 'models/grid_model'
require_relative 'models/player'

require_relative 'views/btn_item'
require_relative 'views/game_views/game_view'
require_relative 'views/game_views/game_grid_view'
require_relative 'views/game_views/game_control_row_view'
require_relative 'views/game_views/game_header_view'
require_relative 'views/game_views/game_footer_view'

require_relative 'views/alert_popup/help_view'
require_relative 'views/alert_popup/popup_view'

class GameWindow < Gosu::Window


  def initialize
    super 343, 568, false
    Gosu::enable_undocumented_retrofication
    self.caption = "ConnectAll"
    # @song = Gosu::Song.new(self, "assets/music/castle01.mp3")
    # @song.play(true)
    @models = [Models::GameStateModel.new]
    @controllers = [Controllers::GameCtrl.new(self, @models.first)]
    @currentCtrl = @controllers.first
  end

  def needs_cursor?
    true
  end

  def button_down(key)
    if key == Gosu::MsLeft then
      @currentCtrl.clicked
    end
  end

  def draw
    @currentCtrl.draw
  end

  def update
    @currentCtrl.update
  end

  def clicked
    @currentCtrl.clicked
  end

end

@window = GameWindow.new
@window.show
