module GameControllerContracts
  class GameControllerContractError < RuntimeError
  end

  def invariant?(controller)
    if controller.window == nil raise GameControllerContractError.new, "GameCtrl must have a window" end
    if controller.model == nil raise GameControllerContractError.new, "GameCtrl must have a model" end
    if controller.window == nil raise GameControllerContractError.new, "GameCtrl must have a view" end

    if controller.alert_view != nil and controller.model.state != :paused raise GameControllerContractError.new, "Game state must be paused during alerts" end
  end

  def post_reset_match(controller)
    if controller.model.state != :active raise GameControllerContractError.new, "Game State corrupted" end
  end

  def pre_button_click(controller, x)
    if x > controller.model.grid.x or x < 1 raise GameControllerContractError.new, "Button click does not correspond to a column on the grid"
  end
end