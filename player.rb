class Player
  attr_reader :guess, :name

  def initialize(name)
    @guess = ''
    @name = name
  end

  def make_guess
    puts 'Enter a guess:'
    @guess = gets.chomp
    until validated?(@guess)
      puts 'Invalid guess'
      puts 'Enter a guess:'
      @guess = gets.chomp
    end
    @guess
  end

  def validated?(guess)
    guess.match?(/[a-zA-Z]/)
  end
end
