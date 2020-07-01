require_relative 'board'
class Player
  attr_accessor :tag
  def initialize(name, tag)
    @name = name
    @tag = tag
    @@board = Board.new
  end

  def player_turn?
    puts "#{@name}'s turn"
    @@board.build_board
    puts "Enter the position you'd like to play (e.g a, b, d e.t.c)"
    position = gets.chomp
    until /^[a-z]$/i =~ position && @@board.check_for_empty_cells?(position, @tag)
      puts 'Invalid position'
      puts "Enter the position you'd like to play (e.g a, b, d e.t.c)"
      position = gets.chomp
    end
    if @@board.check_for_all_wins?
      @@board.build_board
      puts "#{@name} wins!".green
      return true
    end
    @@board.build_board
    if @@board.check_for_full_board?
      puts 'Board is full!'.yellow
      return true
    end
    false
  end
end
