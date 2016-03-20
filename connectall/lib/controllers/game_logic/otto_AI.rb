module GameLogic
  class OttoAI < AI

    ##
    # OTTO AI implementation
    # 

    def initialize(model)
      @model = model
    end

    ##
    # Chooses the location for AI position
    # Inputs: none
    # Outputs: x position

    def choose_location
      rando = Random.new
      return rando.rand(1..8)
    end
  end
end
