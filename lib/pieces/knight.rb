require 'pry-byebug'

class Knight < Piece
  WHITE = '♘' 
  BLACK = "♞"

  MOVES = [[2, 1], [1, 2], [2, -1], [1, -2], [-1, -2], [-2, -1], [-2, 1], [-1, 2]]

  def initialize(location, color, board)
    super
  end

  def find_every_move
    row = location[0]
    column = location[1]
    all_moves = []

    MOVES.each do |move|
      all_moves << [row + move[0], column + move[1]]
    end
    all_moves
  end

  def find_all_moves
    @valid_moves = find_every_move.select do |move| 
      move if board.square_empty?(move)
    end
  end

  def find_capture_moves
    @valid_capture_moves = find_every_move.select do |move|
      next if board[move] == ' '
      move if board.in_bounds?(move) && board.piece_color_in_square(move) != board[location].color
    end
  end
end