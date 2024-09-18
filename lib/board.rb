# JM, 09/18/2024
#
# This class ...
class Board
  attr_accessor :board

  def initialize
    @board = Array.new(8) { Array.new(8) { nil } }
  end

  def self.translate_notation(notation)
    notation.to_s if notation.instance_of? Symbol
    return nil unless notation[0].between?('a', 'h') || notation[1].to_i.between?(1, 8)
    return nil unless notation.length == 2

    [('a'..'h').to_a.index(notation[0]), notation[1].to_i - 1]
  end
end
