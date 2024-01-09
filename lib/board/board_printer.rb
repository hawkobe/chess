class BoardPrinter 
  SQUARE = '[ ]'

  attr_reader :board_length

  def initialize(board_length) 
    @board_length = board_length
  end

  def print_board
    board_length.times do |row|
      board_length.times do |column|
        column < 7 ? print(SQUARE) : puts(SQUARE)
      end
    end
  end

end