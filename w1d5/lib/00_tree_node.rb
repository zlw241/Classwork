require_relative "searchable"

class PolyTreeNode
  include Searchable
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
    self
  end

  def add_many(many_childs)
    many_childs.each { |c| self.add_child(c) }
    self
  end

  def remove_child(child_node)
    raise "Error" if child_node.parent.nil?
    self.children.delete(child_node)
    child_node.parent = nil
    self
  end


  def has_children?
    self.children != []
  end

  def inspect
    "#{{value: self.value, parent: self.parent, children: self.children }}"
  end

end
