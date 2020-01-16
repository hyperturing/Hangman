class Player
  attr_reader :guess, :name

  def initialize(name)
    @guess = []
    @name = name
  end

  def make_guess
    puts 'Enter a guess:'
    @guess = gets.chomp.downcase
  end
end
