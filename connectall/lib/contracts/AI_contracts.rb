module AIModelContracts

  def valid_block(grid_model, select_val)
    if select_val < or select_val > grid_model.x raise GameStateError, "Bad AI input" end
  end

end
