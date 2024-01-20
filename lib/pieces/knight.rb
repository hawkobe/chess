class Knight < Piece
  WHITE = '♘' 
  BLACK = "♞"

  def initialize(location, color, board)
    super
  end

  def find_all_moves
    row = location[0]
    column = location[1]
    moves = []
    (-2..2).each do |i|
      next if i.zero?

      j = i.abs == 2 ? 1 : 2
      moves << [row - j, column + i]
      moves << [row + j, column + i]
    end
    moves
  end

  def find_empty_square_moves
    @valid_moves = find_all_moves.select do |move| 
      move if board.square_empty?(move)
    end
  end

  def find_capture_moves
    @valid_capture_moves = find_all_moves.select do |move|
      next if board[move] == ' '
      move if board.in_bounds?(move) && board.piece_color_in_square(move) != board[location].color
    end
  end
end