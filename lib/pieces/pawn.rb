require 'colorize'
require 'pry-byebug'

class Pawn < Piece
  WHITE = "♙"
  BLACK = "\u265F"

  attr_accessor :first_move

  def initialize(location, color, board)
    super
    @first_move = true
  end
  # in some function will have to change first move to false,
  # but probably not until it *actually moves*, rather
  # than just looks for moves
  def find_every_move
    row = location[0]
    column = location[1]
    all_moves = []

    self.first_move ? push_first_move_set(all_moves, row, column) : push_regular_move_set(all_moves, row, column)
    push_capture_move_set(all_moves, row, column)
    
    all_moves
  end

  def push_first_move_set(moves_array, row, column)
    if color == :white
      moves_array.push([row - 1, column], [row - 2, column])
    else
      moves_array.push([row + 1, column], [row + 2, column])
    end
  end

  def push_regular_move_set(moves_array, row, column)
    color == :white ? moves_array << [row - 1, column] : moves_array << [row + 1, column]
  end

  def push_capture_move_set(moves_array, row, column)
    if color == :white
      target_squares = [[row - 1, column - 1], [row - 1, column + 1]]
      occupied_target_squares = target_squares.reject { |square| board.square_empty?(square) }
      occupied_target_squares.each { |square| moves_array << square } unless occupied_target_squares.empty?
    else
      target_squares = [[row + 1, column - 1], [row + 1, column + 1]]
      occupied_target_squares = target_squares.reject { |square| board.square_empty?(square) }
      occupied_target_squares.each { |square| moves_array << square } unless occupied_target_squares.empty?
    end
  end

  def find_all_moves
    @valid_moves = find_every_move.select do |move|
      move if board.square_empty?(move)
    end
  end

  def find_capture_moves
    @valid_captures = find_every_move.select do |move|
      next if board[move] == ' '
      move if board.in_bounds?(move) && board.piece_color_in_square(move) != board[location].color
    end
  end
end