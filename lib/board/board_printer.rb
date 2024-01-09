require 'colorize'

class BoardPrinter 
  FIRST_FLOOR = '+--------+'
  FLOOR = '--------+'

  FIRST_ROW_BLACK = '|        |'
  FIRST_ROW_WHITE = "|████████|"
  BLACK_ROW = '        |'
  WHITE_ROW = "████████|"

  SQUARE_HEIGHT = 3

  attr_reader :board_length, :board

  def initialize(board) 
    @board = board
    @board_length = board.class::BOARD_LENGTH
  end

  def print_board
    print_floor
    board_length.times do |row_number|
      SQUARE_HEIGHT.times { print_row(row_number) }
      print_floor
    end
  end

  def clear_screen
    system 'clear'
  end

  private

  def print_floor
    puts FIRST_FLOOR + FLOOR * (board_length - 1)
  end

  def print_row(row_number)
    puts row_number.even? ? row : row.reverse
  end

  def row
    FIRST_ROW_WHITE + 
      (BLACK_ROW + WHITE_ROW) * 3 +
      BLACK_ROW
  end
end