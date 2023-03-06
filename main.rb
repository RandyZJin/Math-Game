require './player'
require './game_state'

bob = Player.new
joe = Player.new
new_game = Game_state.new(bob, joe)
while bob.lives > 0 && joe.lives > 0
  puts new_game.question(rand(1..20), rand(1..20))
  new_game.new_turn
end
# if bob.lives == 0 || joe.lives == 0
#   puts new_game.result
# end
# new_game.players