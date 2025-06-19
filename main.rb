require_relative 'lib/knight'

def notation(node)
  [('a'..'h').to_a.index(node[0]), node[1].to_i - 1]
end

print 'Please enter starting node (a1-h8): '
start = notation gets.chomp

print 'Please enter ending node (a1-h8): '
ending = notation gets.chomp

knight = Knight.new
moves = knight.knight_moves start, ending

puts "The knight can move from #{start} to #{ending} like so:"

moves.each do |move|
  print "\t"
  print move
  print ' =>' unless moves.last == move
  puts
end
