require 'pry-byebug'

class Player 
  attr_reader :color, :name, :board

  def initialize(name, color, board)
    @name = name
    @color = color
    @board = board
  end

  def select_piece
    puts "Alright, #{name}, it's your turn. Please select a piece you would like to move"
    input = gets.chomp
    until piece_input_valid?(convert_player_input(input))
      invalid_input_response(convert_player_input(input))
      input = gets.chomp
    end
    puts "okay so you've selected #{input}. Great!"
    board.currently_selected_piece = board[convert_player_input(input)]
    input
  end

  def select_move
    puts "Okay, now where would you like to move?"
    input = gets.chomp
    until move_input_valid?(convert_player_input(input))
      puts "oops, that input doesn't work. Try again"
      input = gets.chomp
    end
    puts "okay you'd like to move to #{input}"
    input
  end

  def convert_player_input(input)
    [board.class::MOVE_HASH[input[1]], board.class::MOVE_HASH[input[0]]]
  end

  def piece_input_valid?(converted_input)
    board.in_bounds?(converted_input) && 
    board[converted_input].is_a?(Piece) && 
    board[converted_input].color == self.color &&
    board[converted_input].has_valid_moves?
  end

  def move_input_valid?(converted_input)
    board.currently_selected_piece.valid_moves.include?(converted_input) || board.currently_selected_piece.valid_captures.include?(converted_input)
  end

  def invalid_input_response(converted_input)
    if !board.in_bounds?(converted_input)
      puts 'Sorry, that place doesn\'t exist on the board'
    elsif board[converted_input] == ' '
      puts 'Oops, doesn\'t seem to be a piece there'
    elsif board[converted_input].color != self.color
      puts 'That\'s not your piece!'
    else
      puts 'That piece doesn\'t have any moves!'
    end 
  end

  def to_s
    color
  end

end