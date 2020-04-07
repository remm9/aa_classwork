require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :mark, :children
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @mark = next_mover_mark
    @prev_move_pos = nil
    @children = []
    @board = board
  end

  def children
    (0...3).each do |row|
      (0...3).each do |col|
        new_board = @board

        if @board[row, col].empty?
          
          if @mark == :x
            next_mover_mark = :o
          else 
            next_mover_mark = :x
          end 

          new_board[row][col] = @mark
          @children << TicTacToeNode.new(new_board, next_mover_mark, [row, col])
          
        end
      end
    end
  end 



  def losing_node?(evaluator)  
    return true if @board.winner == @mark 
    # losing_node?(evaluator)
  end

  def winning_node?(evaluator)
    
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
  end
end
