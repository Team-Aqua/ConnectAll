require 'gosu'
# require_relative 'header.rb'
# require_relative 'board.rb'
# require_relative 'buttons.rb'
require_relative 'controllers/game_controllers/game_ctrl'
require_relative 'models/game_state_model'
require_relative 'views/game_views/game_view'
require_relative 'views/game_views/game_grid_view'
class GameWindow < Gosu::Window


  def initialize
    super 343, 568, false
    Gosu::enable_undocumented_retrofication
    self.caption = "ConnectAll"
    # @song = Gosu::Song.new(self, "assets/music/castle01.mp3")
    # @song.play(true)

    @models = []
    @controllers = [Controllers::GameCtrl.new(self, Models::GameStateModel.new), Controllers::MainMenuCtrl.new(self)]
    @currentCtrl = @controllers.first

    # @header = Header.new(self)
    # @board = Board.new
    # @buttons = Buttons.new(self)
  end

  def needs_cursor?
    true
  end

  def reset
    # @header = Header.new(self)
    # @board = Board.new
    # @buttons = Buttons.new(self)
  end



  def update
    @currentCtrl.update
    # @header.update
  end

  # def update_grid(x)
  #   @board.update_grid(x)
  #   shift_team
  # end


  # def shift_team
  #   @board.shift_team
  #   @header.shift_team
  #   # @header.draw
  #   # @board.draw
  # end

  def button_down(key)
    if key == Gosu::MsLeft then
      @currentCtrl.clicked
        # @buttons.clicked
        # @header.clicked
    end
  end

  def draw
    @currentCtrl.draw
    # @header.draw
    # @board.place(29, 116)
    # @buttons.place(169, 470)
    # @board.draw
    # @buttons.draw
  end

end

@window = GameWindow.new
@window.show
