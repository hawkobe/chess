class Rook < Piece
  WHITE = '♖'
  BLACK = '♜'

  MOVES = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  def initialize(location, color, board)
    super
  end

end