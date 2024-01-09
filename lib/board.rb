class Board
  BOARD_LENGTH = 8

  attr_reader :positions_matrix

  def initialize
    @positions_matrix = Array.new(BOARD_LENGTH) { Array.new(BOARD_LENGTH)}
  end
  
  def [](square)
    row, column = square
    positions_matrix[row][column]
  end

  def []=(square, piece)
    row, column = square
    positions_matrix[row][column] = piece
  end

  def move_piece!(move)
    piece = move.first
    target_square = move.last

    self[target_square] = self[piece]

    self[piece] = nil
  end

  def in_bounds?(square)
    square.none? { |position| position >= BOARD_LENGTH || position < 0 }
  end

  def square_empty?(square)
    row, column = square
    in_bounds?(square) && positions_matrix[row][column].nil?
  end
end