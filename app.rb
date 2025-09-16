require_relative 'lib/player'
require_relative 'lib/game'

puts "Bienvenue dans le Morpion !"
print "Nom du joueur 1 (X) : "
p1_name = gets.chomp
print "Nom du joueur 2 (O) : "
p2_name = gets.chomp

player1 = Player.new(p1_name, "X")
player2 = Player.new(p2_name, "O")

game = Game.new(player1, player2)
game.play
