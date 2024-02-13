require_relative 'board.rb'
# require_relative 'piece.rb'
require_relative 'player.rb'

class Game 
  include Messages

  attr_reader :board, :player_one, :player_two, :printer

  def initialize(board)
    @board = board
    @printer = BoardPrinter.new(board)
  end

  def setup_game
    puts introduction
    # method HERE to determine what type of game will be played
    assign_players
    determine_first_to_play
    board.setup_board
  end

  def assign_players
    puts player_setup_intro
    player_one_name = gets.chomp
    puts player_two_setup
    player_two_name = gets.chomp
    printer.clear_screen
    puts assign_player_colors_message(player_one_name, player_two_name)
    @player_one = Player.new(player_one_name, [:white, :black].sample, board)
    @player_two = @player_one.color == :white ? Player.new(player_two_name, :black, board) : Player.new(player_two_name, :white, board)
  end

  def determine_first_to_play
    player_one.color == :white ? puts(announce_white(player_one.name)) : puts(announce_white(player_two.name))
  end
end
