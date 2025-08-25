require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  it 'initialize new board with empty' do
    expect(board.grid.flatten.compact).to be_empty
  end

  it 'place piece lowest empty row' do
    board.place_piece(0, 'X')
    expect(board.grid[5][0]).to eq('X')
  end

  it 'Stacks symbols correctly in a column' do
    2.times { board.place_piece(0, 'x') }
    expect(board.grid[4][0]).to eq('x')
  end

  it 'Raises an error when placed in a full column' do
    6.times { board.place_piece(0, 'x') }
    expect { board.place_piece(0, 'x') }.to raise_error('Column is full')
  end

  it 'Detects a horizontal win' do
    4.times { |i| board.place_piece(i, 'x') }
    expect(board.winning_move?('x')).to be true
  end

  it 'Detects a vertical win' do
    4.times { board.place_piece(0, 'x') }
    expect(board.winning_move?('x')).to be true
  end

  it 'Detects a diagonal win' do
    board.place_piece(0, 'x')
    board.place_piece(1, 'o')
    board.place_piece(1, 'x')
    board.place_piece(2, 'o')
    board.place_piece(2, 'o')
    board.place_piece(2, 'x')
    board.place_piece(3, 'o')
    board.place_piece(3, 'o')
    board.place_piece(3, 'o')
    board.place_piece(3, 'x')
    expect(board.winning_move?('x')).to be true
  end
end
