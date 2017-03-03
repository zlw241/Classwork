require_relative 'tic_tac_toe'
require_relative '00_tree_node'

class TicTacToeNode
  attr_accessor :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
  end

  def winning_node?(evaluator)
  end

  def winner
    (board + cols + diagonals).each do |triple|
      return :x if triple == [:x, :x, :x]
      return :o if triple == [:o, :o, :o]
    end
    nil
  end

  def cols
    rows.transpose
  end

  def diagonals
    down_diag = [[0, 0], [1, 1], [2, 2]]
    up_diag = [[0, 2], [1, 1], [2, 0]]

    [down_diag, up_diag].map do |diag|
      diag.map { |row, col| grid[row][col] }
    end
  end


  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    new_board = Array(3) { Array (3) }
    root = PolyTreeNode.new(new_board)
    possible_moves =
  end
end
