require_relative '../lib/board'

describe Board do
  subject(:board) { described_class.new }
  it 'initialize new board with empty' do
    expect(board.grid.flatten.compact).to be_empty
  end
end
