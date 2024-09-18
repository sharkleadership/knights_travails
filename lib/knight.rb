require_relative 'board'
# JM, 09/18/2024
#
# This class creates a Knight piece and handles moving the piece.
class Knight
  def initialize(start_square, board_reference, color = :black)
    @board = board_reference
    start_square = correct_square_notation(start_square)
    @current_square = start_square
    p @board.board[start_square[0]][start_square[1]] = 'N'
  end

  def legal_moves(square)
    square = correct_square_notation(square)
    return if square.nil?

    array = []
    move_array = move_types
    8.times do |num|
      move = [square[0] + move_array[num][0], square[1] + move_array[num][1]]
      array << move if move.all? { |xy| xy.between?(0, 7) }
    end
    array
  end

  def move_types
    move_types = []
    (-2..2).to_a.reject(&:zero?).repeated_permutation(2) do |perm|
      move_types << perm unless perm.sum.zero? || perm.sum == perm[0] * 2
    end
    move_types
  end

  def knight_moves(starting, ending)
    starting = correct_square_notation(starting)
    ending = correct_square_notation(ending)
  end

  def correct_square_notation(square)
    return Board.translate_notation(square) unless square.instance_of? Array

    return nil unless square.all? { |xy| xy.between?(0, 7) }

    square
  end
end
