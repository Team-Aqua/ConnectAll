module GameStateModelContracts

  def invariant(model)
    if model.state == nil raise GameStateError, "Game state should not be nil" end
      
    
  end
end