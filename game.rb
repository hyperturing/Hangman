# frozen_string_literal: true

class Game
  require_relative 'player'
  require_relative 'board'

  attr_reader :round

  def initialize
    puts instructions
    @player = Player.new('Ash')
    @board = Board.new
    @round = 1
  end

  def play_round
    puts "Round #{round}"
    @board.display_board
    @board.evaluate_guess(@player.make_guess)
    @round += 1
  end

  def complete?
    @board.winner? || @board.loser?
  end

  def end_game
    @player.name + (@board.winner? ? ' won!' : ' lost!')
  end

  def instructions
    ["Welcome to Hangman!!\n",
     'Instructions:',
     "====================\n\n",
     "Your mission: guess the secret word\n\n",
     "We will provide you with a couple letters of the secret word,\n\n",
     "Along with the length of the secret word,\n\n",
     "But the rest is up to you\n\n",
     'Good luck!!',
     '====================='].join("\n") + "\n"
  end
end
