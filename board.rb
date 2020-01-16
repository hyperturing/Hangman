class Board
  attr_reader :letters_left, :incorrect_guesses, :guesses

  def initialize
    words = open('5desk.txt', 'r').read.split("\r")
    @secret_word = words.sample.gsub!(/[^0-9A-Za-z]/, '').downcase.split('')
    @letters_left = @secret_word.dup
    @guesses = []
    @incorrect_guesses = 0
  end

  def display_board
    puts "Secret word: #{@secret_word} \n\n"
    puts "letters left: #{letters_left}\n\n"
    puts "Guesses: #{guesses}\n\n"
  end

  def winner?
    @letters_left.size <= 0
  end

  def loser?
    incorrect_guesses >= 8
  end

  def evaluate_guess(guess)
    @guesses.push(guess)
    if @letters_left.include?(@guesses.last)
      @letters_left.delete_at(@letters_left.index(@guesses.last))
    else
      puts "Letter #{@guesses.last} not found in word\n\n"
      @incorrect_guesses += 1
    end
  end
end
