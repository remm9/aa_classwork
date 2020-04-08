require_relative "00_tree_node.rb"
require "byebug"

class KnightPathFinder
    attr_reader :starting_node
  def self.valid_moves(position) #1, 1   -  
    valid_moves = []   
    
    possible_from_start = [[-2, -1] , [-2, 1] , [-1, 2], [-1, -2], [1, -2], [1, 2], [2, -1], [2, 1]]
    
    possible_from_start.each do |move|
      possible_move = [position[0] + move[0] , position[1] + move[1]]
      if possible_move.all? { |n| (0...8).to_a.include?(n) }
        valid_moves << possible_move
      end 
    end 

    valid_moves
  end
  
  def initialize(position)
    @starting_node = PolyTreeNode.new(position)
    @considered_positions = [position]
    # @grid = Array.new(8) {Array.new(8, [])}
  end

  def new_move_positions(pos)
    possible_moves = KnightPathFinder.valid_moves(pos) 
    possible_moves.reject { |el| @considered_positions.include?(el) }
  end

  def build_move_tree
    queue = [@starting_node]
    until queue.empty?
      parent = queue.shift
      possible_positions = new_move_positions(parent.value) 
      possible_positions.each { |pos| @considered_positions << pos }
      possible_positions.map! { |position| PolyTreeNode.new(position) }
      possible_positions.each { |child| parent.add_child(child) }
      queue += possible_positions
    end
  end 

  def find_path(end_pos)
    @end_node = @starting_node.dfs(end_pos)
  end
  
  
  def trace_path_back
    current_node = @end_node  #[7, 7]
    positions_arr = []

    while true
      if current_node.parent == nil
      positions_arr << current_node.value
      break
      else
      positions_arr << current_node.value
      current_node = current_node.parent
      end
    end 

    positions_arr.reverse

  end

end


# if $PROGRAM_NAME == __FILE__
  # kpf = KnightPathFinder.new([1, 0])
  # p kpf.find_path([7, 7])
# end


knight_1 = KnightPathFinder.new([7, 7])
knight_1.build_move_tree
# p knight_1.starting_node.children.map { |child| child.value }
# p "------"
knight_1.find_path([1, 1])
# p"-----"
p knight_1.trace_path_back


# Phase II: #build_move_tree
# Let's return to #build_move_tree. We'll use our #new_move_positions instance method.

# To ensure that your tree represents only the shortest path to a given position, build your tree in a breadth-first manner. Take inspiration from your BFS algorithm: use a queue to process nodes in FIFO order. Start with a root node representing the start_pos and explore moves from one position at a time.

# Next build nodes representing positions one move away, add these to the queue. Then take the next node from the queue... until the queue is empty.

# When you have completed, and tested, #build_move_tree get a code review from your TA.
