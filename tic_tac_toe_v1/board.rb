#fix up win conditions/DRY
#add a loop for starting up another game?

require_relative "human_player"

class Board
    POSSIBLE_MOVES = [[0, 0], [0, 1], [0, 2],
    [1, 0], [1, 1], [1, 2],
    [2, 0], [2, 1], [2, 2]]

    #ROW_WINNING_COMBOS = [ [ [0, 0], [0, 1], [0, 2] ],
    #[ [1, 0], [1, 1], [1, 2] ], 
    #[ [2, 0], [2, 1], [2, 2] ] ]

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

    #def row_win?
    #    ROW_WINNING_COMBOS.any? do |combos|
    #        combos.all? { |array| self.[](array) == 'X' || self.[](array) == 'O' }
    #    end
    #end

    def row_win?
        if @grid[0][0] == 'X' && @grid[0][1] == 'X' && @grid[0][2] == 'X' ||
            @grid[0][0] == 'O' && @grid[0][1] == 'O' && @grid[0][2] == 'O'
            puts "You win!"
            return true
        elsif @grid[1][0] == 'X' && @grid[1][1] == 'X' && @grid[1][2] == 'X' ||
            @grid[1][0] == 'O' && @grid[1][1] == 'O' && @grid[1][2] == 'O'
            puts "You win!"
            return true
        elsif @grid[2][0] == 'X' && @grid[2][1] == 'X' && @grid[2][2] == 'X' ||
            @grid[2][0] == 'O' && @grid[2][1] == 'O' && @grid[2][2] == 'O'
            puts "You win!"
            return true
        else
            return false
        end
    end

    def column_win?
        if @grid[0][0] == 'X' && @grid[1][0] == 'X' && @grid[2][0] == 'X' ||
            @grid[0][0] == 'O' && @grid[1][0] == 'O' && @grid[2][0] == 'O'
            puts "You win!"
            return true
        elsif @grid[0][1] == 'X' && @grid[1][1] == 'X' && @grid[2][1] == 'X' ||
            @grid[0][1] == 'O' && @grid[1][1] == 'O' && @grid[2][1] == 'O'
            puts "You win!"
            return true
        elsif @grid[0][2] == 'X' && @grid[1][2] == 'X' && @grid[2][2] == 'X' ||
            @grid[0][2] == 'O' && @grid[1][2] == 'O' && @grid[2][2] == 'O'
            puts "You win!"
            return true
        else
            return false
        end
    end

    def diagonal_win?
        if @grid[0][0] == 'X' && @grid[1][1] == 'X' && @grid[2][2] == 'X' ||
            @grid[0][0] == 'O' && @grid[1][1] == 'O' && @grid[2][2] == 'O'
            puts "You win!"
            return true
        elsif @grid[0][2] == 'X' && @grid[1][1] == 'X' && @grid[2][0] == 'X' ||
            @grid[0][2] == 'O' && @grid[1][1] == 'O' && @grid[2][0] == 'O'
            puts "You win!"
            return true
        else
            return false
        end
    end
end

#b = Board.new
#b.print
#b.[]=([0, 0], :X)
#puts "---------------"
#b.print
#b.[]=([1, 0], :X)
#b.[]=([2, 0], :X)
#puts "------------"
#b.print
#b.row_win?
#b.column_win?
#p b.valid_move?([0, 0])
#p b.valid_move?([3, 0])
