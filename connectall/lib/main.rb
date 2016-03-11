require 'gosu'

require_relative 'controllers/game_controllers/game_ctrl'
require_relative 'controllers/view_controllers/main_menu_ctrl'

require_relative 'models/game_state_model'
require_relative 'models/grid_model'
require_relative 'models/player'

require_relative 'views/btn_item'
require_relative 'views/game_views/game_view'
require_relative 'views/game_views/game_grid_view'
require_relative 'views/game_views/game_control_row_view'
require_relative 'views/game_views/game_header_view'
require_relative 'views/game_views/game_footer_view'

require_relative 'views/menu_views/menu_view'
require_relative 'views/menu_views/main_menu_view'
require_relative 'views/menu_views/mode_menu_view'


require_relative 'views/alert_popup/help_view'
require_relative 'views/alert_popup/popup_view'

class GameWindow < Gosu::Window


  def initialize(h, w, model: nil)
    super w, h, false
    Gosu::enable_undocumented_retrofication
    self.caption = "ConnectAll"
    # @song = Gosu::Song.new(self, "assets/music/castle01.mp3")
    # @song.play(true)
    if model != nil
      @models = [model]
    else
      @models = [Models::GameStateModel.new]
    end
    
    @controllers = [Controllers::MainMenuCtrl.new(self, @models.first), Controllers::GameCtrl.new(self, @models.first)]
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

  def start_game
    initialize(568, 343, model: @models[0])
    @currentCtrl = @controllers[1]
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

@window = GameWindow.new(347, 533)
@window.show
