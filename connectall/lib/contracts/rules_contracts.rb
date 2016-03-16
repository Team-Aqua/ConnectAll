module RulesContracts
  class RulesContractError < RuntimeError
  end

  # handles rules, otto_rules, classic_rules
  def invariant(game_state_model)
    if game_state_model.state == nil raise RulesContractError.new, "Game state should not be nil" end   
    if game_state_model.grid == nil raise RulesContractError.new, "Grid should not be nil" end   
    if game_state_model.player_turn_state == nil or game_state_model.player_turn_state > 2 or game_state_model.player_turn_state < 0 raise RulesContractError.new, "Bad number of players" end  
    if game_state_model.players.count <= 0 raise RulesContractError.new, "Bad number of players" end
  end

  def otto_model(game_state_model)
    if game_state_model::game_mode != :otto
      raise RulesContractError.new, "Invalid game mode selected."
    end
  end

  def classic_model(game_state_model)
    if game_state_model::game_mode != :classic
      raise RulesContractError.new, "Invalid game mode selected."
    end
  end

end