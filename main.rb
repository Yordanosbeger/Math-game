require 'pp'
require './game'
require'./players'
require'./question'

one = Game.new('Alex', 'Jhon')
two = Game.new('Jhon', 'Alex')
three = Game.new('Alex', 'Jhon')
four = Game.new('Jhon', 'Alex')

one.play
 puts '------new turn-------'
two.play
 puts '------new turn-------'
three.play
 puts '------new turn-------'
four.play
puts '------new turn-------'

game = Game.new('Alex', 'John')
game.play
alex = game.players[0]
john = game.players[1]

game.turn(alex)
game.turn(john)

winner = [one, two, three, four].max_by { |game| game.winner.score }
puts "#{winner.winner.name} wins with a score of #{winner.winner.score}/3!"
puts '------new turn-------'
puts 'GAME OVER'
