require_relative '../lib/player'

describe Player do
  subject(:player) { described_class.new('John', 'X') }

  it 'store the name player' do
    expect(player.name).to eq('John')
  end

  it 'store the symbol player' do
    expect(player.symbol).to eq('X')
  end
end
