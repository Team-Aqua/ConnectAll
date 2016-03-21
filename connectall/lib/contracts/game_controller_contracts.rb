module GameControllerContracts
  class GameControllerContractError < RuntimeError
  end

  def self.invariant?(controller)
    if controller.window == nil then raise GameControllerContractError.new, "GameCtrl must have a window" end
    if controller.game_state_model == nil then raise GameControllerContractError.new, "GameCtrl must have a model" end
    if controller.window == nil then raise GameControllerContractError.new, "GameCtrl must have a view" end

      #TODO: CLEAN THIS UP
    if controller.alert_view == nil and controller.game_state_model.state != :active then raise GameControllerContractError.new, "Game state must be paused during alerts" end
  end

  def self.post_reset_match(controller)
    if controller.game_state_model.state != :active then raise GameControllerContractError.new, "Game State corrupted" end
  end

  def pre_button_click(controller, x)
    if x > controller.game_state_model.grid.x or x < 1 then raise GameControllerContractError.new, "Button click does not correspond to a column on the grid" end
  end
end