class King < Piece
  WHITE = "♔"
  BLACK = "♚"

  MOVES = [[1, 1], [1, -1], [-1, -1], [-1, 1], [0, 1], [0, -1], [1, 0], [-1, 0]]

  def initialize(location, color, board)
    super
  end

  def find_every_move
    all_moves = []

    MOVES.each do |move|
      all_moves << location.zip(move).map { |a, b| a + b }
    end
    all_moves
  end

  def find_all_moves
    @valid_moves = find_every_move.select do |move| 
      move if board.square_empty?(move)
    end
  end

  def find_capture_moves
    @valid_capture_moves = find_every_move.select do |move|
      next if board[move] == ' '
      move if board.in_bounds?(move) && board.piece_color_in_square(move) != board[location].color
    end
  end
end