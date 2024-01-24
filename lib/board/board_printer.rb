require 'colorize'

class BoardPrinter 
  COLUMN_LETTERS = *('A'..'H')
  ROW_NUMBERS = [*('1'..'8')].reverse
  MARGIN = " " * 3

  FIRST_ROW_BLACK = "       ".colorize(:background => :black)
  FIRST_ROW_WHITE = "       ".colorize(:background => :gray)
  BLACK_ROW = "       ".colorize(:background => :black)
  WHITE_ROW = "       ".colorize(:background => :gray)

  attr_reader :board_length, :board

  def initialize(board) 
    @board = board
    @board_length = board.class::BOARD_LENGTH
  end

  def print_board
    print_column_letters
    board_length.times do |row_number|
      print_row(row_number)
      print ROW_NUMBERS[row_number]
      print_piece_row(row_number)
      puts MARGIN + ROW_NUMBERS[row_number]
      print_row(row_number)
    end
    new_line
    print_column_letters
  end

  def clear_screen
    system 'clear'
  end

  private

  def print_floor
    puts MARGIN + FIRST_FLOOR + FLOOR * (board_length - 1)
  end

  def print_row(row_number)
    puts row_number.even? ? white_starting_row : black_starting_row
  end

  def print_piece_row(row_number)
    board_length.times do |column|
      square = [row_number, column]

      if white_square?(square) then print_white_square(square, column)
      else print_black_square(square, column)
      end
    end
  end

  def white_square?(square)
    row = square.first
    column = square.last

    row.even? && column.even? || row.odd? && column.odd?
  end

  def display_square(square)
    if board.currently_selected_piece.valid_moves.include?(square)
      "\u25CF".light_red
    elsif board.currently_selected_piece.valid_captures.include?(square)
      board[square].to_s.light_red
    else
      board[square]
    end
  end

  def print_white_square(square, column)
    print(
      if column.zero?
        "  " + "   #{display_square(square)}   ".colorize(:background => :gray)
      else
        "   #{display_square(square)}   ".colorize(:background => :gray)
      end
    )
  end

  def print_black_square(square, column)
    print(
      if column.zero?
        "  " + "   #{display_square(square)}   ".colorize(:background => :black)
      else
        "   #{display_square(square)}   ".colorize(:background => :black)
      end
    )
  end

  def white_starting_row 
    MARGIN +
      FIRST_ROW_WHITE +
      (BLACK_ROW + WHITE_ROW) * 3 +
      BLACK_ROW
  end
  
  def black_starting_row
    MARGIN +
      FIRST_ROW_BLACK +
      (WHITE_ROW + BLACK_ROW) * 3 +
      WHITE_ROW
  end

  def print_column_letters
    COLUMN_LETTERS.each { |letter| print "      #{letter}" }
    new_line
    new_line
  end

  def new_line(amount_of_lines=1)
    amount_of_lines.times { puts '' }
  end
end