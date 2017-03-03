class PolyTreeNode
  attr_accessor :children, :value, :par

  def initialize(value = nil)
    @value = value
    @children = []
    @par = nil
  end

  def parent=(node)
    if self.par.nil?
      @par = node
      node.add_child(self)
    else
      node.add_child(self)
      self.par.children.delete(self)
      self.par = node
    end
  end

  def add_child(node)
    self.children << node unless self.children.include?(node)
  end
end


n1 = PolyTreeNode.new("root1")
n2 = PolyTreeNode.new("root2")
n3 = PolyTreeNode.new("root3")

# connect n3 to n1
n3.parent = n1
# connect n3 to n2
n3.parent = n2


# this should work
raise "Bad parent=!" unless n3.par == n2
raise "Bad parent=!" unless n2.children == [n3]

# this probably doesn't
raise "Bad parent=!" unless n1.children == []
