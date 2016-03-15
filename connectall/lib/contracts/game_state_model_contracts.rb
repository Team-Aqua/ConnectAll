module GameStateModelContracts
  class GameStateModelError < RuntimeError
  end

  def invariant?(model)
    if model.state ==:won and model.winner == nil raise GameStateError, "Game State won, but no winner declared" end
    if model.grid == nil raise GameStateError, "No grid." end

    if model.state !=:creation and model.mode == nil raise GameStateError, "Active game requires game mode" end
    if model.state !=:creation and model.type == nil raise GameStateError, "Active game requires game type" end
    if model.state !=:creation and model.game_mode_logic == nil raise GameStateError, "Active game requires game logic" end

    if model.player_turn_state + 1 > model.players.count raise GameStateError, "turn state larger than player num" end
    if model.player_turn_state  >=  0 raise GameStateError, "Illegal turn state: Must be greater or equal to 0" end

    if model.state !=:creation and model.players.count > model.num_of_rl_players and model.ai == nil raise GameStateError, "Active game requires AI" end      
    return true
  end
end