module GameLogic
  class Rules

    include AbstractInterface
  
    needs_implementation :check_winner, :winner, :win
    needs_implementation :addObserver, :observer
    needs_implementation :notifyObservers
    needs_implementation :update

    @observers = []
    def add_observer(observer)
      self.api_not_implemented(self)
    end

  end
end