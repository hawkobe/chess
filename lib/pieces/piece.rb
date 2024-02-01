require 'colorize'
require 'pry-byebug'


class Piece
  attr_reader :location, :color, :board, :valid_moves, :valid_captures, :highlighted_moves

  def initialize(location, color, board)
    @location = location
    @color = color
    @board = board
    @valid_moves = []
    @valid_captures = []
    @highlighted_moves = []
  end

  #for queen, bishop, rook
  def find_all_moves
    @valid_moves = []
    row = location[0]
    column = location[1]

    self.class::MOVES.each do |move|
      target_square = [row + move[0], column + move[1]]
      while board.square_empty?(target_square)
        @valid_moves << target_square
        target_square = [target_square[0] + move[0], target_square[1] + move[1]]
      end
    end
    @valid_moves
  end

  #for queen, bishop, rook
  def find_capture_moves
    @valid_captures = []
    row = location[0]
    column = location[1]

    self.class::MOVES.each do |move|
      target_square = [row + move[0], column + move[1]]
      while board.square_empty?(target_square)
        target_square = [target_square[0] + move[0], target_square[1] + move[1]]
      end
      next unless board.in_bounds?(target_square) &&
                  board.piece_color_in_square(target_square) != board[location].color
      valid_captures << target_square
    end
    @valid_captures
  end

  def has_valid_moves?
    @valid_captures.length > 0 || @valid_moves.length > 0
  end

  def to_s
    case color
    when :white then self.class::WHITE
    else self.class::BLACK.light_cyan
    end
  end
end
