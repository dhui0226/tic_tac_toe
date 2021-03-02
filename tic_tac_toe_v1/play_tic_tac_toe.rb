require_relative "game"

tic_tac_toe = Game.new
tic_tac_toe.start_game

until tic_tac_toe.game_over? do 
    puts "----------"
    tic_tac_toe.place_mark
end