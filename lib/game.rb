# frozen_string_literal: true

require_relative 'player'
require 'colorize'
class Game
  def player_info
    puts "Input player 1's name"
    player_name1 = gets.chomp
    while player_name1.empty? || /\W/ =~ player_name1
      puts 'Enter a valid name'
      player_name1 = gets.chomp
    end
    puts "#{player_name1}'s tag is ".concat('◉'.red)
    @player1 = Player.new(player_name1, '◉'.red)

    puts "Input player 2's name"
    player_name2 = gets.chomp
    while player_name2.empty? || /\W/ =~ player_name2
      puts 'Enter a valid name'
      player_name2 = gets.chomp
    end
    puts "#{player_name2}'s tag is ".concat('◉'.blue)
    @player2 = Player.new(player_name2, '◉'.blue)
  end

  def play
    loop do
      break if @player1.player_turn?
      break if @player2.player_turn?
    end
  end
end
