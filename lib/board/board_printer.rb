class BoardPrinter 
  FIRST_FLOOR = '+--------+'
  FLOOR = '--------+'
  FIRST_WALL = '|        |'
  WALLS = '        |'
  SQUARE_HEIGHT = 3

  attr_reader :board_length, :board

  def initialize(board) 
    @board = board
    @board_length = board.class::BOARD_LENGTH
  end

  def print_board
    print_floor
    SQUARE_HEIGHT.times { print_row }
    print_floor
  end

  def clear_screen
    system 'clear'
  end

  private

  def print_floor
    puts FIRST_FLOOR + FLOOR * (board_length - 1)
  end

  def print_row
    puts FIRST_WALL + WALLS * (board_length - 1)
  end

end