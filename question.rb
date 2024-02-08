class Question
  attr_reader :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
  end

  def ask(player_name)
    puts "#{player_name}, what is #{@num1} + #{@num2}?"
    gets.chomp.to_i
  end

  def correct?(answer)
    answer.to_i == @num1 + @num2
  end
end