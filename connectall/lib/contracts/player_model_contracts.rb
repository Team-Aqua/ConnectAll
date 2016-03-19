module PlayerModelContracts
  class PlayerModelContractError < RuntimeError
  end

  def invariants?(model)
    if mode.player_num < 0 raise PlayerModelContractError.new, "player_num must be positive" end
    if mode.score < 0 raise PlayerModelContractError.new, "players score must be positive" end
  end
end