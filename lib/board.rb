require 'colorize'
class Board
  def initialize
    @@board_array = Array.new(6) { Array.new(7) { '' } }
  end

  def build_board
    a = @@board_array
    puts <<-HEREDOC
      |----+----+----+----+----+----+----|
      |  #{a[0][0]}  |  #{a[0][1]}  |  #{a[0][2]}  |  #{a[0][3]}  |  #{a[0][4]}  |  #{a[0][5]}  |  #{a[0][6]}  |                    
      |----+----+----+----+----+----+----|
      |  #{a[1][0]}  |  #{a[1][1]}  |  #{a[1][2]}  |  #{a[1][3]}  |  #{a[1][4]}  |  #{a[1][5]}  |  #{a[1][6]}  | 
      |----+----+----+----+----+----+----|
      |  #{a[2][0]}  |  #{a[2][1]}  |  #{a[2][2]}  |  #{a[2][3]}  |  #{a[2][4]}  |  #{a[2][5]}  |  #{a[2][6]}  |                    
      |----+----+----+----+----+----+----|
      |  #{a[3][0]}  |  #{a[3][1]}  |  #{a[3][2]}  |  #{a[3][3]}  |  #{a[3][4]}  |  #{a[3][5]}  |  #{a[3][6]}  |
      |----+----+----+----+----+----+----|
      |  #{a[4][0]}  |  #{a[4][1]}  |  #{a[4][2]}  |  #{a[4][3]}  |  #{a[4][4]}  |  #{a[4][5]}  |  #{a[4][6]}  |                    
      |----+----+----+----+----+----+----|
      |  #{a[5][0]}  |  #{a[5][1]}  |  #{a[5][2]}  |  #{a[5][3]}  |  #{a[5][4]}  |  #{a[5][5]}  |  #{a[5][6]}  | 
      |----+----+----+----+----+----+----|
         a    b    c    d    e    f    g
           HEREDOC
  end

  def check_for_empty_cells?(position, tag)
    cell = first_cell_to_check_for_empty_space(position)
    return false if cell == -1

    5.downto(0) do |i|
      if @@board_array[i][cell].empty?
        @@board_array[i][cell] = tag
        return true
      end
    end
    false
  end

  def check_for_full_board?
    @@board_array.flatten.any?('') ? false : true
  end

  def check_for_all_wins?
    return true if check_for_wins_vertically?
    return true if check_for_wins_horizontally?
    return true if check_for_wins_in_the_left_diagonals?
    return true if check_for_wins_in_the_right_diagonals?

    false
  end

  private

  def check_for_wins_vertically?
    0.upto(5) do |i|
      0.upto(3) do |j|
        if (@@board_array[i][j] == @@board_array[i][j+1]) && (@@board_array[i][j] == @@board_array[i][j+2]) && (@@board_array[i][j] == @@board_array[i][j+3]) && (@@board_array[i][j] != '')
          @@board_array[i][j] = '◈'.green
          @@board_array[i][j+1] = '◈'.green
          @@board_array[i][j+2] = '◈'.green
          @@board_array[i][j+3] = '◈'.green
          return true
        end
      end
    end
    false
  end

  def check_for_wins_horizontally?
    0.upto(6) do |j|
      0.upto(2) do |i|
        if (@@board_array[i][j] == @@board_array[i+1][j]) && (@@board_array[i][j] == @@board_array[i+2][j]) && (@@board_array[i][j] == @@board_array[i+3][j]) && (@@board_array[i][j] != '')
          @@board_array[i][j] = '◈'.green
          @@board_array[i+1][j] = '◈'.green
          @@board_array[i+2][j] = '◈'.green
          @@board_array[i+3][j] = '◈'.green
          return true
        end
      end
    end
    false
  end

  def check_for_wins_in_the_left_diagonals?
    6.downto(3) do |j|
      0.upto(2) do |i|
        if (@@board_array[i][j] == @@board_array[i+1][j-1]) && (@@board_array[i][j] == @@board_array[i+2][j-2]) && (@@board_array[i][j] == @@board_array[i+3][j-3]) && (@@board_array[i][j] != '')
          @@board_array[i][j] = '◈'.green
          @@board_array[i+1][j-1] = '◈'.green
          @@board_array[i+2][j-2] = '◈'.green
          @@board_array[i+3][j-3] = '◈'.green
          return true
        end
      end
    end
    false
  end

  def check_for_wins_in_the_right_diagonals?
    0.upto(3) do |j|
      0.upto(2) do |i|
        if (@@board_array[i][j] == @@board_array[i+1][j+1]) && (@@board_array[i][j] == @@board_array[i+2][j+2]) && (@@board_array[i][j] == @@board_array[i+3][j+3]) && (@@board_array[i][j] != '')
          @@board_array[i][j] = '◈'.green
          @@board_array[i+1][j+1] = '◈'.green
          @@board_array[i+2][j+2] = '◈'.green
          @@board_array[i+3][j+3] = '◈'.green
          return true
        end
      end
    end
    false
  end

  def first_cell_to_check_for_empty_space(choice)
    case choice
    when 'a'
      cell = 0
    when 'b'
      cell = 1
    when 'c'
      cell = 2
    when 'd'
      cell = 3
    when 'e'
      cell = 4
    when 'f'
      cell = 5
    when 'g'
      cell = 6
    else
      return -1
    end
    cell
  end
end
