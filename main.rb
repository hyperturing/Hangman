# frozen_string_literal: true

require_relative 'game'
require_relative 'utils'

if Utils.ask_yes_no_question('Do you want to load a previous game?')
  game = Marshal.load(File.binread('saved_game'))
else
  game = Game.new
end

until game.complete?
  game.play_round

  if Utils.ask_yes_no_question('Do you want to save your game?')
    File.open('saved_game', 'wb') { |f| f.write(Marshal.dump(game)) }
  end
end

puts game.end_game
