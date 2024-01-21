require_relative 'bishop.rb'
require_relative 'rook.rb'
require_relative 'knight.rb'

class Queen < Piece
  WHITE = '♕'
  BLACK = "♛"

  MOVES = [
    Bishop::MOVES,
    Rook::MOVES,
  ].flatten(1)

  def initialize(location, color, board)
    super
  end

end