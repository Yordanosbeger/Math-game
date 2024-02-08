class Game
  def initialize(player1_name, player2_name)
    @players = [Player.new(player1_name), Player.new(player2_name)]
  end

  def play
    until game_over?
      @players.each do |player|
        turn(player)
        display_scores
        puts '------new turn-------'
        break if game_over?
      end
    end
    display_winner
    puts 'GAME OVER'
  end

  def turn(player)
    question = generate_question
  
    loop do
      player_answer = question.ask(player.name)
      if question.correct?(player_answer)
        player.increment_score
        puts 'Correct! Good job.'
        display_scores
        puts '------new turn-------'
        break
      else
        player.decrement_lives
        puts 'Seriesly?No You lose a life.'
      end
  
      break if player.lives.zero?
    end
  end
  
  def generate_question
    Question.new
  end

  def get_player_answer(player)
    print "#{player.name}, your answer: "
    gets.chomp.to_i
  end

  def game_over?
    @players.any? { |player| player.lives.zero? }
  end

  def display_scores
    @players.each do |player|
       puts "#{player.name}: Lives: #{player.lives} | Score: #{player.score}"
      end
  end
  
def display_winner
  winner = @players.max_by(&:score)
  loser_score = @players.min_by(&:score).score

  if @players[0].score == @players[1].score
    puts "It's a Tie! Both players scored #{winner.score}/3."
  else
    puts "#{winner.name} wins with a score of #{winner.score}/3!"
    puts "#{winner.name}'s opponent scored #{loser_score}/3."
  end
 end
end

