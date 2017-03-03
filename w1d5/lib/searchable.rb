
module Searchable

  def dfs(target)
    if self.value == target
      self
    elsif self.has_children?
      found = nil
      children.each do |child|
        search = child.dfs(target)
        if search
          found = search
          break
        end
      end
      found
    else
      nil
    end
  end

  def bfs(target)
    queue = []
    queue << self
    until queue.empty?
      node = queue.shift

      if node.has_children?
        node.children.each { |child| queue << child }
      end
      return node if node.value == target
    end

    nil
  end

end
