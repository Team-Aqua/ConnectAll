module Views
  class View
    include AbstractInterface

    needs_implementation :update

    @controller = nil
    @model = nil

    def set_model(model)
      @model = model
    end
  end
end