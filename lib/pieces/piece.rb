require 'colorize'

class Piece
  attr_reader :location, :color, :board

  def initialize(location, color, board)
    @location = location
    @color = color
    @board = board
    @valid_moves = []
  end

  def to_s
    case color
    when :white then self.class::WHITE
    else self.class::BLACK.light_cyan
    end
  end
end
