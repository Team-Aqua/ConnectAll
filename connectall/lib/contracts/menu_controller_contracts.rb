module MenuControllerContracts

  def invariant(game_state_model)
    if game_state_model.player_turn_state == nil or game_state_model.player_turn_state > 2 or game_state_model.player_turn_state < 0 raise GameStateError, "Bad number of players" end  
    if game_state_model.players.count < 0 raise GameStateError, "Bad number of players" end 
  end

  def post_alert_selection(alert_view)
    if alert_view == nil raise GameStateError, "Alert didn't popup" end
  end

  def pre_alert_selection(alert_view)
    if alert_view != nil raise GameStateError, "Can't double alert view" end
  end

end 