class Piece
  attr_reader :location, :color

  def initialize(location, color)
    @location = location
    @color = color
  end

  def to_s
    case color
    when :white then self.class::WHITE
    else self.class::BLACK
    end
  end
end