#fix up win conditions/DRY
#add a loop for starting up another game?

require_relative "human_player"

class Board
    POSSIBLE_MOVES = [[0, 0], [0, 1], [0, 2],
    [1, 0], [1, 1], [1, 2],
    [2, 0], [2, 1], [2, 2]]

    ROW_WINNING_COMBOS = [ [ [0, 0], [0, 1], [0, 2] ],
    [ [1, 0], [1, 1], [1, 2] ], 
    [ [2, 0], [2, 1], [2, 2] ] ]

    COLUMN_WINNING_COMBOS = [ [ [0, 0], [1, 0], [2, 0] ],
    [ [0, 1], [1, 1], [2, 1] ],
    [ [0, 2], [1, 2], [2, 2] ] ]

    DIAGONAL_WINNING_COMBOS = [ [ [0, 0], [1, 1], [2, 2] ],
    [ [0, 2], [1, 1], [2, 0] ] ]
    
    def initialize
        @grid = Array.new(3) { Array.new(3, '_') }
    end

    def print_grid(array)
        array.each do |subarray|
            puts subarray.join("|")
        end
    end
    
    def print
        print_grid(@grid)
    end

    def [](position)
        row, column = position
        @grid[row][column]
    end

    def valid_move?(position)
        POSSIBLE_MOVES.include?(position)
    end

    def empty_space?(position)
        if valid_move?(position) && self.[](position) == "_"
            true
        else
            return false
        end
    end

    def []=(position, mark)
        row, column = position
        @grid[row][column] = mark 
    end

    def row_win?
        ROW_WINNING_COMBOS.any? do |combos|
            combos.all? { |array| self.[](array) == 'X' }
            combos.all? { |array| self.[](array) == 'O' }
        end
    end

    def column_win?
        COLUMN_WINNING_COMBOS.any? do |combo|
            combo.all? { |array| self.[](array) == 'X' }
            combo.all? { |array| self.[](array) == 'O' }
        end
    end

    def diagonal_win?
        DIAGONAL_WINNING_COMBOS.any? do |combo|
            combo.all? { |array| self.[](array) == 'X' }
            combo.all? { |array| self.[](array) == 'O' }
        end
    end
end
