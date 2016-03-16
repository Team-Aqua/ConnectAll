module MainControllerContracts
  class MainControllerContractError < RuntimeError
  end

  def invariant?(window)
    if window.model == nil raise MainControllerContractError.new, "window requires a game state model" end
    if window.controllers[:menu] == nil raise MainControllerContractError.new, "window requires a menu controller" end      
    if window.controllers[:game] == nil raise MainControllerContractError.new, "window requires a game controller" end      
  end

end