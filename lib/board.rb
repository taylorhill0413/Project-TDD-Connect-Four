class Board
  attr_reader :grid

  COLUMNS = 7
  ROWS = 6
  def initialize
    @grid = Array.new(ROWS) { Array.new(COLUMNS, nil) }
  end

  def place_piece(column, symbol)
    raise 'Column out of bounds' if column < 0 || column >= COLUMNS

    row = check_column(column)
    raise 'Column is full' if row.nil?

    grid[row][column] = symbol
    row
  end

  def check_column(column)
    (ROWS - 1).downto(0).find { |row| grid[row][column].nil? }
  end

  def full?
    grid.flatten.none?(&:nil)
  end

  def display
    puts(grid.map { |row| row.map { |cell| cell || '-' }.join(' ') })
    puts (0...COLUMNS).to_a.join(' ')
  end

  def winning_move?(symbol)
    horizontal_win?(symbol) || vertical_win?(symbol) || diagonal_win?(symbol)
  end

  def horizontal_win?(symbol)
    grid.any? do |row|
      row.each_cons(4).any? { |group| group.all? { |cell| cell == symbol } }
    end
  end

  def vertical_win?(symbol)
    grid.transpose.any? do |row|
      row.each_cons(4).any? { |group| group.all? { |cell| cell == symbol } }
    end
  end

  def diagonal_win?(symbol)
    diagonal.any? do |row|
      row.each_cons(4).any? { |group| group.all? { |cell| cell == symbol } }
    end
  end

  def diagonal
    diags = []
    (ROWS - 4).times do |r|
      (COLUMNS - 4).times do |c|
        diags << [grid[r][c], grid[r + 1][c + 1], grid[r + 2][c + 2], grid[r + 3][c + 3]]
        # diags << (0..3).map { |i| grid[r + i][c + i] }
      end
    end

    (3..ROWS - 1).each do |r|
      (COLUMNS - 4).times do |c|
        diags << [grid[r][c], grid[r - 1][c + 1], grid[r - 2][c + 2], grid[r - 3][c + 3]]
        # diags << (0..3).map { |i| grid[r - i][c + i] }
      end
    end
    diags
  end
end
