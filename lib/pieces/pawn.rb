require 'colorize'

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
    all_moves
  end

  def push_first_move_set(moves_array, row, column)
    if color == :white
      moves_array << [row - 1, column]
      moves_array << [row - 2, column]
    else
      moves_array << [row + 1, column]
      moves_array << [row + 2, column]
    end
  end

  def push_regular_move_set(moves_array, row, column)
    color == :white ? moves_array << [row - 1, column] : moves_array << [row + 1, column]
  end

  def find_all_moves
    @valid_moves = find_every_move.select do |move| 
      move if board.square_empty?(move)
    end
  end
end