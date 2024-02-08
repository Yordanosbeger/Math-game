class Player
  
  attr_accessor :name, :lives, :score

  def initialize(name)
    @name = name
    @lives = 3
    @score = 0
  end

  def decrement_lives
    @lives -= 1
  end

  def increment_score
    @score += 1
  end
end