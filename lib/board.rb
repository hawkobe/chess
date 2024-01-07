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
end