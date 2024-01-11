require 'colorize'

class BoardPrinter 
  FIRST_FLOOR = '+--------+'
  FLOOR = '--------+'
  COLUMN_LETTERS = *('A'..'H')
  LEFT_MARGIN = " " * 3

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
    print_column_letters
    print_floor
    board_length.times do |row_number|
      SQUARE_HEIGHT.times { print_row(row_number) }
      print_floor
    end
    print_column_letters
  end

  def clear_screen
    system 'clear'
  end

  private

  def print_floor
    puts LEFT_MARGIN + FIRST_FLOOR + FLOOR * (board_length - 1)
  end

  def print_row(row_number)
    puts row_number.even? ? white_starting_row : black_starting_row
  end

  def white_starting_row
    LEFT_MARGIN +
      FIRST_ROW_WHITE +
      (BLACK_ROW + WHITE_ROW) * 3 +
      BLACK_ROW
  end
  
  def black_starting_row
    LEFT_MARGIN +
      FIRST_ROW_BLACK +
      (WHITE_ROW + BLACK_ROW) * 3 +
      WHITE_ROW
  end

  
  def print_column_letters
    COLUMN_LETTERS.each_with_index do |letter, index|
      index < 7 ? print("        #{letter}") : puts("        #{letter}")
    end
  end
end