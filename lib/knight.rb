# JM, 06/18/2025
#
# This class creates a Knight piece and handles moving the piece.
class Knight
  def knight_moves(starting, ending)
    visited = Set[starting]
    queue = legal_moves(starting).map { |node| [node, starting] }

    until queue.empty?
      moves = queue.shift
      break if moves[0] == ending

      visited << moves
      queue += (legal_moves(moves[0]) - visited.to_a).map { |node| [node, moves] }
    end

    unpack moves
  end

  private

  def unpack(trail)
    moves = []
    while trail[1].is_a? Array
      moves << trail[0]
      trail = trail[1]
    end

    (moves << trail).reverse
  end

  def legal_moves(node)
    move_offsets.map { |offset| [(node[0] + offset[0]), (node[1] + offset[1])] }
                .filter { |move| move.all? { |xy| xy.between?(0, 7) } }
  end

  def move_offsets
    (-2..2).to_a.reject(&:zero?).repeated_permutation(2).reject do |perm|
      perm.sum.zero? || perm.sum == perm[0] * 2
    end
  end
end
