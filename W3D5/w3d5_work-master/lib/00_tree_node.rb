require "byebug"

class PolyTreeNode
  # attr_reader :value, :parent, :children
  attr_accessor :children, :parent, :value
  def initialize(value, children = [])
    @parent = nil
    @children = children
    @value = value
  end

  def parent=(parent_node)
    # child to assign parent node
    # if already has parent, delete this node from old parent's children
    # 
    return @parent = parent_node if parent_node == nil

    old_parent_node = self.parent
    old_parent_node.children.delete(self) unless old_parent_node == nil

    @parent = parent_node
    parent_node.children << self unless parent_node.children.include?(self)
  end 
  
  def add_child(child_node)
    child_node.parent = self
    self.children << child_node unless self.children.include?(child_node)
  end

  def remove_child(child_node)
    self.children.include?(child_node) ? child_node.parent = nil : raise
  end

  def bfs(target)
    # TODO: pseudocode
    return self if self.value == target
    queue = [self]
   # b c 
  #  debugger
    until queue.empty?
      # debugger
      if queue[0].value == target
        return queue[0]
      else
        first_val = queue.shift
        first_val.children.each { |child| queue << child }
      end 
      nil

    end

    # queue   c d e           f g

    #     # search tree layer -by- layer
    #     p root
    #     p queue = root

    #     #create queue w/ root node
    #     #until queue empty process all ele's FIFO
    #       #shift off 1'st node
    #       #dequeing and check to see if it's what we're looking for
    #       #if it is is -> return in
    #       #otherwise -> push all node's children into queue and repeat
    #     #return nil

    #   end
  end
    #     a
    #  b    c   
    #d  e  f  g

  def dfs(target)
    return self if self.value == target
    # debugger
    self.children.each do |node|
        dfs(node)
      # if node.value == target
      #   return node
      # else
      #   node.dfs(target)
      # end
    end
    return nil if self.children.empty?
    p new_arr
  end 
   
  # checking given nodes value

    # if value is what we are looking for -> return it
    # otherwise call dfs on each of the nodes children

    #return value of dfs??
    #if the target is within the childs subtree -> return the target node
    #and if the target is not found -> return nil
    #after recursing through every child -> return nil b/c we have not found our target
end
