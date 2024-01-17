require 'colorize'

class Piece
  attr_reader :location, :color

  def initialize(location, color)
    @location = location
    @color = color
  end

  def to_s
    case color
    when :white then self.class::WHITE
    else self.class::BLACK.light_cyan
    end
  end
end
