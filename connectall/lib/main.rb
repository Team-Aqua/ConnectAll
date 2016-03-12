require 'gosu'

require_relative 'ancillaries/abstractInterface'

require_relative 'controllers/game_controllers/game_ctrl'
require_relative 'controllers/view_controllers/menu_ctrl'


require_relative 'controllers/game_logic/rules'
require_relative 'controllers/game_logic/classic_rules'
require_relative 'controllers/game_logic/otto_rules'

require_relative 'controllers/game_logic/AI'
require_relative 'controllers/game_logic/classic_AI'
require_relative 'controllers/game_logic/otto_AI'


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
require_relative 'views/menu_views/type_menu_view'
require_relative 'views/menu_views/mode_menu_view'
require_relative 'views/menu_views/player_select_menu_view'

require_relative 'views/animations/basic'


require_relative 'views/alert_popup/help_view'
require_relative 'views/alert_popup/win_view'
require_relative 'views/alert_popup/popup_view'

class GameWindow < Gosu::Window


  def initialize(h, w, model: nil)
    super w, h, false
    Gosu::enable_undocumented_retrofication
    self.caption = "ConnectAll"
    @song = Gosu::Song.new(self, "assets/music/bitbop.mp3")
    @song.volume = 0.5
    @song.play(true)
    if model != nil
      @models = [model]
    else
      @models = [Models::GameStateModel.new]
    end
    
    @controllers = [Controllers::MenuCtrl.new(self, @models.first), Controllers::GameCtrl.new(self, @models.first)]
    @currentCtrl = @controllers.first

    @fps_init = Time.now.to_f
    @fps_counter = 0
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

  def fps
    if Time.now.to_f < (@fps_init + 1.0)
      @fps_counter = @fps_counter + 1
    else
      puts @fps_counter
      @fps_counter = 0
      @fps_init = Time.now.to_f
    end
  end

  def draw
    fps
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
