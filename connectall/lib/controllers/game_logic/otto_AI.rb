module GameLogic
  class OttoAI < AI
    def initialize(model)
      @model = model
    end

    def choose_location
      rando = Random.new
      return rando.rand(1..8)
    end
  end
end
