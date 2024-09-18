require_relative 'lib/knight'

board = Board.new

knight = Knight.new([3, 3], board)

pp board.board

p Board.translate_notation :g3

p knight.legal_moves(:g3)
