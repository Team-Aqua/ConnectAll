require 'gosu'
require_relative 'header.rb'
require_relative 'board.rb'
require_relative 'buttons.rb'

class GameWindow < Gosu::Window

	def initialize
		super 343, 568, false
		Gosu::enable_undocumented_retrofication
		self.caption = "ConnectAll"
    @header = Header.new(self)
    @board = Board.new(self)
    @buttons = Buttons.new(self)
    @win_status = 0
	end

	def reset
    @header = Header.new(self)
    @board = Board.new(self)
    @buttons = Buttons.new(self)
	end

	def win(playernum)
		@header.win(playernum)
		@board.win(playernum)
		@buttons.win
		@win_status = 1
	end

	def needs_cursor?
    true
  end

	def update
		@buttons.update
		@header.update
	end

	def update_grid(x)
		@board.update_grid(x)
		if @win_status == 0
			shift_team
		end
	end


	def shift_team
		@board.shift_team
		@header.shift_team
		# @header.draw
		# @board.draw
	end

	def button_down(key)
    if key == Gosu::MsLeft then
        @buttons.clicked
        @header.clicked
    end
  end

	def draw
		@header.draw
		@board.place(29, 116)
		@buttons.place(169, 470)
		@board.draw
		@buttons.draw
	end

end

@window = GameWindow.new
@window.show
