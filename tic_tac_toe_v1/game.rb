require_relative "board"
require_relative "human_player"

class Game
    attr_reader :board, :player
    attr_accessor :turn

    def initialize
        @board = Board.new
        @player = Player.new
        @turn = 0
    end

    def start_game
        board.print
    end

    def mark
        turn % 2 == 0 ? 'X' : 'O'
    end

    def place_mark
        move_choice = player.get_move

        if board.empty_space?(move_choice)
            board.[]=(move_choice, self.mark)
        else
            puts "Invalid move"
        end

        @turn += 1
        board.print
    end

    def game_over?
        if (board.row_win? || board.column_win? || board.diagonal_win?)
            true
        elsif turn >= 9
            puts "It's a tie"
            true
        else
            false
        end
    end
end