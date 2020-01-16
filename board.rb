class Board
  attr_reader :letters_left, :incorrect_guesses, :guesses

  def initialize
    words = open('5desk.txt', 'r').read.split("\r")
    @secret_word = words.sample.gsub!(/[^0-9A-Za-z]/, '').downcase.split('')
    @letters_left = @secret_word.dup
    @correct_letters = []
    @guesses = []
    @incorrect_guesses = 0
  end

  def display_board
    puts "Secret word: #{display_word} \n\n"
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
      @letters_left.delete(@guesses.last)
      @correct_letters.push(@guesses.last)
    else
      puts "Letter #{@guesses.last} not found in word\n\n"
      @incorrect_guesses += 1
    end
  end

  def display_word
    @secret_word.map do |letter|
      @guesses.include?(letter) ? " #{letter} " : ' _ '
    end
  end
  def display_hangman

  end
end
