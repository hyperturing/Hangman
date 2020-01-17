class Board
  attr_reader :letters_left, :incorrect_guesses, :guesses
  MAX_INCORRECT_GUESSES = 8

  def initialize
    words = open('5desk.txt', 'r').read.split("\r")
    @hangman = open('hangman.txt', 'r')
    @secret_word = words.sample.gsub!(/[^0-9A-Za-z]/, '').downcase.split('')

    @letters_left = @secret_word.dup
    @correct_letters = []
    @guesses = []
    @incorrect_guesses = 0
  end

  def display_board
    puts "Secret word: #{display_word} \n\n"
    puts "Guesses: #{guesses}\n\n"
    display_hangman
  end

  def winner?
    @letters_left.size <= 0
  end

  def loser?
    incorrect_guesses >= MAX_INCORRECT_GUESSES
  end

  def evaluate_guess(guess)
    @guesses.push(guess)
    if @letters_left.include?(@guesses.last)
      @letters_left.delete(@guesses.last)
      @correct_letters.push(@guesses.last)
    else
      @incorrect_guesses += 1
      puts "Letter #{@guesses.last} not found in word\n\n"
      puts "#{MAX_INCORRECT_GUESSES - incorrect_guesses} guesses left\n\n"
    end
  end

  def display_word
    @secret_word.map do |letter|
      @guesses.include?(letter) ? " #{letter} " : ' _ '
    end
  end

  def display_hangman
    for i in 0..incorrect_guesses * 3 do
      puts @hangman.readline
    end
    @hangman.rewind
  end
end
