require_relative 'board'
require_relative 'player'

class Game
  def initialize
    @board = Board.new
    @players = create_player
    @current_players_idx = 0
  end

  def play
    loop do
      @board.display
      current_player = @players[@current_players_idx]
      puts "#{current_player.name}'s turn with symbol ()#{current_player.symbol}"
      begin
        pos = ask_column
        @board.place_piece(pos, current_player.symbol)
      rescue StandardError => e
        put e.message
        retry
      end

      if @board.winning_move?(current_player.symbol)
        @board.display
        puts "#{current_player.name} is win!"
        break
      elsif @board.full?
        @board.display
        puts "It's draw"
        break
      end

      # Swtich player
      @current_players_idx = if @current_players_idx == 0
                               1
                             else
                               0
                             end
    end
  end

  def create_player
    print 'Enter name of player 1:'
    name1 = gets.chomp
    print ' Enter name of player 2:'
    name2 = gets.chomp
    [Player.new(name1, 'X'), Player.new(name2, 'O')]
  end

  def ask_column
    print 'Enter column (1 - 6): '
    gets.to_i
  end
end
