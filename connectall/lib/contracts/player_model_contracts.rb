module PlayerModelContracts
  class PlayerModelContractError < MContractError
    def initialize(error)
      super(error)
    end
  end

  def invariants?(model)
    if mode.player_num < 0 then raise PlayerModelContractError.new("player_num must be positive") end
    if mode.score < 0 then raise PlayerModelContractError.new("players score must be positive") end
  end
end