module GridModelContracsts
  class GridModelError < RuntimeError
  end

  def invariant(model)
    if model.x < 1 raise GridModelError.new, "column number should be greater than 0" end
    if model.y < 1 raise GridModelError.new, "row number should be greater than 0" end
    if model.grid == nil raise GridModelError.new, "Grid does not exist" end
    model.grid.each do |tile|
      if val != 0 and val != 1 and val != 2 raise GridModelError.new, "Grid Value Incorrect" end 
    end
  end 

  def pre_generate_grid(model)
    if model.x < 1 raise GridModelError.new, "column number should be greater than 0" end
    if model.y < 1 raise GridModelError.new, "row number should be greater than 0" end
  end

  def post_generate_grid(model)
    if model.grid == nil raise GridModelError.new, "Grid does not exist" end
  end

  def pre_column_depth(model, col)
    if  col < 0 or col > model.x raise GridModelError.new, "column specified not within grid column range" end
  end

  def pre_column_depth(model, val)
    if  val > model.y raise GridModelError.new, "depth exceeds grid height" end
    if  val < 0 raise GridModelError.new, "depth smaller than 0" end
  end

  def pre_get_value(model, x, y)
    invariant(model)
    if x < 0 rause GridModelError.new, "column index must be greater than zero" end
    if y < 0 rause GridModelError.new, "row index must be greater than zero" end
    if x > model.x - 1 raise  GridModelError.new, "column index must be greater than grids row range" end
    if y > model.x - 1 raise  GridModelError.new, "row index must be smaller than grids row range" end
  end

  def post_get_value(model, val)
    if val != 0 and val != 1 and val != 2 raise GridModelError.new, "Grid Corrupted. Found incorrect value" end
  end

  def pre_set_value(model, x, y, val)
    invariant(model)
    if x < 0 rause GridModelError.new, "column index must be greater than zero" end
    if y < 0 rause GridModelError.new, "row index must be greater than zero" end
    if x > model.x - 1 raise  GridModelError.new, "column index must be greater than grids row range" end
    if y > model.x - 1 raise  GridModelError.new, "row index must be smaller than grids row range" end
    if val != 0 and val != 1 and val != 2 raise GridModelError.new, "Grid Set Value Incorrect" end 
  end

  def post_set_value(model)
    model.grid.each do |tile|
      if val != 0 and val != 1 and val != 2 raise GridModelError.new, "Grid Value Incorrect" end 
    end
  end

  def add_tile(model, x, playernum)
    if model.column_depth(x) == 0, raise GridModelError.new, "Cannot add tile to a full column" end
    if playernum != 1 and playernum != 2 raise GridModelError.new, "Playernum not within player range" end 
  end

  def post_add_tile(model)
    model.grid.each do |tile|
      if val != 0 and val != 1 and val != 2 raise GridModelError.new, "Grid Value Incorrect" end 
    end
  end

  def post_reset(model)
    model.grid.each do |tile|
      if val != 0 raise GridModelError.new, "Grid Reset Corrupt" end 
    end
  end

end