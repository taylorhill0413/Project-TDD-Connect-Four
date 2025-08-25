require_relative '../lib/game'

describe Game do
  it 'Creates two players ' do
    allow_any_instance_of(Kernel).to receive(:gets).and_return("Alice\n", "Bob\n")
    game = Game.new
    expect(game.instance_variable_get(:@players).size).to eq(2)
  end
end
