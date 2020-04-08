require_relative "piece.rb"

class Board

    attr_reader :rows

    def initialize
        @rows = Array.new(8) { Array.new(8, nil)}
        @sentinel = nil
        [0, 1, 6, 7].each do |row|
            (0..7).each do |col|
                @rows[row][col] = Piece.new
            end
        end
    end

    def valid_pos?(pos)
        x, y = pos
        x.between?(0, 7) && y.between?(0, 7)
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end


    def move_piece(start_pos, end_pos)
        raise "invalid position" if !valid_pos?(start_pos) || !valid_pos?(end_pos)

        raise "there is no piece there" if self[start_pos] == nil # TypeError: no implicit conversion of Array into Integer

        piece = self[start_pos]

        # raise "cannot move there" unless piece.valid_moves.include?(end_pos)

        @rows[start_pos] = nil
        add_piece(end_pos)
    end
    
    def [](pos)
        row, col = pos
        @rows[row][col]
    end

    def []=(pos, val)
        x, y = pos
        @rows[x][y] = val
    end

end

b1 = Board.new

# p b1.rows[4][0]

p b1[[0, 0]] # => piece
p b1[[4, 4]] # => nil

b1.move_piece([0, 0], [4, 4])

p b1[[0, 0]] # => nil
p b1[[4, 4]] # => piece