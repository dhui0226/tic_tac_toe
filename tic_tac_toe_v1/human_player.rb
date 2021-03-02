class Player
    def get_move
        move = gets.chomp
        move.split.map { |num| num.to_i }
    end
end

#player = Player.new
#player.get_move