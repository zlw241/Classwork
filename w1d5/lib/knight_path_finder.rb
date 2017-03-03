require_relative "00_tree_node"


class KnightPathFinder
  MOVES = [[-2, -1], [-2, 1], [-1, -2], [-1, 2], [1, -2], [1, 2], [2, -1], [2, 1]]
  attr_accessor :position, :board
  def initialize(pos)
    @position = pos
    @board = Array.new(8) { Array.new(8) { false } }
  end

  def [](pos)
    x, y = pos
    self.board[x][y]
  end

  def []=(pos, value)
    x, y = pos
    self.board[x][y] = value
  end

  def make_tree(root)
    children_positions = available_moves(root.value)
    return if children_positions.empty?
    children_positions.each do |ps|
      child_node = PolyTreeNode.new(ps)
      root.add_child(child_node)
      make_tree(child_node)
    end
    root
  end

  def find_path(end_pos)
    found = make_tree(PolyTreeNode.new(position)).bfs(end_pos)
    answer = []
    until found.parent.nil?
      answer << found.value
      found = found.parent
    end
    [position] + answer.reverse

  end

  def available_moves(pos)
    available = MOVES.map do |ps|
      x,y = ps
      [x + pos[0], y + pos[1]]
    end
    available.select! do |ps|
      x,y = ps
      x.between?(0, 7) && y.between?(0, 7) && self[[x,y]] == false
    end
    available.each do |ps|
      x, y = ps
      self[[x,y]] = true
    end
    available
  end
end
