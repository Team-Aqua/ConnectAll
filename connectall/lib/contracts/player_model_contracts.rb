module PlayerModelContracts
  class PlayerModelError < RuntimeError
  end

  def invariants?(model)
    if mode.player_num < 0 raise PlayerModelError.new, "player_num must be positive" end
    if mode.score < 0 raise PlayerModelError.new, "players score must be positive" end
  end
end