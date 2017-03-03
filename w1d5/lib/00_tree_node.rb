class PolyTreeNode
  attr_accessor :children, :value, :parent

  def initialize(value = nil)
    @value = value
    @children = []
    @parent = nil
  end

  def parent=(node)
    if node.nil?
      @parent = nil
      return
    end
    unless node.children.include? self
      if self.parent.nil?
        @parent = node
        node.children << self
      else
        node.children << self
        self.parent.children.delete(self)
        @parent = node
      end
    end
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Error" if child_node.parent.nil?
    self.children.delete(child_node)
    child_node.parent = nil
  end

  def dfs(target)
    if self.value == target
      return self
    else
      children.each { |child| return child.dfs(target) unless child.dfs(target).nil?}
    end
  end
end


# n1 = PolyTreeNode.new("root1")
# n2 = PolyTreeNode.new("root2")
# n3 = PolyTreeNode.new("root3")

# connect n3 to n1
# n3.parentent = n1
# connect n3 to n2
# n3.add_child(n2)
# p n1
# p n2
# p n3
