require_relative '../piece.rb'

class Board
  BOARD_LENGTH = 8
  PIECE_SEQUENCE = [
    Rook, Knight, Bishop, Queen, King, Bishop, Knight, Rook
  ]
  MOVE_HASH = {
    "a" => 0,
    "b" => 1,
    "c" => 2,
    "d" => 3,
    "e" => 4,
    "f" => 5,
    "g" => 6,
    "h" => 7,
    "1" => 7,
    "2" => 6,
    "3" => 5,
    "4" => 4,
    "5" => 3,
    "6" => 2,
    "7" => 1,
    "8" => 0
  }

  attr_reader :positions_matrix
  attr_accessor :currently_selected_piece

  def initialize
    @positions_matrix = Array.new(BOARD_LENGTH) { Array.new(BOARD_LENGTH, ' ')}
    @currently_selected_piece = nil
    @en_passant_active = false
  end
  
  def [](square)
    row, column = square
    positions_matrix[row][column]
  end

  def []=(square, piece)
    row, column = square
    positions_matrix[row][column] = piece
  end

  def move_piece!(move)
    piece = move.first
    target_square = move.last

    self[target_square] = self[piece]

    self[piece] = ' '
  end

  def in_bounds?(square)
    square.none? { |position| position >= BOARD_LENGTH || position < 0 }
  end

  def square_empty?(square)
    row, column = square
    in_bounds?(square) && positions_matrix[row][column] == ' '
  end

  def piece_color_in_square(square)
    self[square].color
  end

  def populate_pawns
    [1, 6].each do |pawn_row|
      color = pawn_row == 1 ? :black : :white

      BOARD_LENGTH.times do |column|
        self[[pawn_row, column]] = Pawn.new([pawn_row, column], color, self)
      end
    end
  end

  def populate_pieces
    [0, 7].each do |pieces_row|
      color = pieces_row == 0 ? :black : :white

      PIECE_SEQUENCE.each_with_index do |piece, index|
        self[[pieces_row, index]] = piece.new([pieces_row, index], color, self)
      end
    end
  end

  def assign_moves
    positions_matrix.each do |row|
      row.each do |square|
        if square.is_a?(Piece)
          square.find_all_moves
          square.find_capture_moves
        else
          next
        end
      end
    end
  end
end