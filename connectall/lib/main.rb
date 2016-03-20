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
require_relative 'models/ai_player'
require_relative 'models/real_player'

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
require_relative 'views/menu_views/text_input'

require_relative 'views/animations/basic'

require_relative 'views/alert_popup/connect_instructions_view'
require_relative 'views/alert_popup/otto_instructions_view'
require_relative 'views/alert_popup/connect_all_view'
require_relative 'views/alert_popup/help_view'
require_relative 'views/alert_popup/win_view'
require_relative 'views/alert_popup/popup_view'

class GameWindow < Gosu::Window

  attr_accessor :game_state_model, :controllers 

  def initialize(h, w, model: nil)
    super w, h, false
    Gosu::enable_undocumented_retrofication
    self.caption = "ConnectAll"
    @song = Gosu::Song.new(self, "assets/music/bitbop.mp3")
    @song.volume = 0.2
    @song.play(true)
    if model != nil
      @game_state_model = model
    else
      @game_state_model = Models::GameStateModel.new
    end
    
    @controllers = {  :menu => Controllers::MenuCtrl.new(self, @game_state_model),
                      :game => Controllers::GameCtrl.new(self, @game_state_model) }
    @currentCtrl = @controllers[:menu]

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
    @currentCtrl.button_down(key)
  end

  def start_menu
    initialize(347, 533)
    @currentCtrl = @controllers[:menu]
  end

  def start_game
    @controllers[:game]::view::grid.set_tiles
    puts @game_state_model::game_type
    puts @controllers[:game]::view::grid.tiles["green"]
    initialize(568, 343, model: @game_state_model)
    @currentCtrl = @controllers[:game]
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
    # fps
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
