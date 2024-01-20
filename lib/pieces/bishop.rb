require 'pry-byebug'

class Bishop < Piece
  WHITE = '♗'
  BLACK = '♝'

  MOVES = [[1, 1], [1, -1], [-1, -1], [-1, 1]]

  def initialize(location, color, board)
    super
  end


  # def find_empty_moves(location=@location, available_moves=[], iteration=0, squares_visited=[])
  #   return if iteration == MOVES.length
    
  #   target_square = [location[0] + MOVES[iteration][0], location[1] + MOVES[iteration][1]]
  #   if board.square_empty?(target_square)
  #     available_moves << target_square unless squares_visited.include?(target_square)
  #     squares_visited << target_square 
  #     find_empty_moves(target_square, available_moves, iteration, squares_visited)
  #   end
  #   iteration += 1
  #   find_empty_moves(self.location, available_moves, iteration, squares_visited)
  #   available_moves
  # end

  # def recursive_test(location=@location, available_moves=[], previous_move=MOVES)
  #   right_down_diagonal, left_down_diagonal, left_up_diagonal, right_up_diagonal = MOVES
  #   return if board.out_of_bounds?(location)

  #   if previous_move.include?(right_down_diagonal)
  #     target_square = location.zip(right_down_diagonal).map { |a, b| a + b }
  #     available_moves << target_square unless board.out_of_bounds?(target_square)
  #     recursive_test(target_square, available_moves, [right_down_diagonal])
  #   end
  #   if previous_move.include?(left_down_diagonal)
  #     target_square = location.zip(left_down_diagonal).map { |a, b| a + b }
  #     available_moves << target_square unless board.out_of_bounds?(target_square)
  #     recursive_test(target_square, available_moves, [left_down_diagonal])
  #   end
  #   if previous_move.include?(left_up_diagonal)
  #     target_square = location.zip(left_up_diagonal).map { |a, b| a + b }
  #     available_moves << target_square unless board.out_of_bounds?(target_square)
  #     recursive_test(target_square, available_moves, [left_up_diagonal])
  #   end
  #   if previous_move.include?(right_up_diagonal)
  #     target_square = location.zip(right_up_diagonal).map { |a, b| a + b }
  #     available_moves << target_square unless board.out_of_bounds?(target_square)
  #     recursive_test(target_square, available_moves, [right_up_diagonal])
  #   end
  #   available_moves
  # end
end