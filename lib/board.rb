class Board
  attr_reader :grid

  COLUMNS = 6
  ROWS = 5
  def initialize
    @grid = Array.new(ROWS) { Array.new(COLUMNS, nil) }
  end
end
