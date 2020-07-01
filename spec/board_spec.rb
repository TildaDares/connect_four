require './lib/board'
require 'colorize'
describe Board do
  board = Board.new
  describe '#check_for_all_wins?' do
    context "when there's a vertical win" do
      it 'returns true' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '◉'.blue, '◉'.blue, '◉'.blue, '◉'.blue, '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to be_check_for_all_wins
      end
    end

    context "when there's a horizontal win" do
      it 'returns true' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['◉'.red, '', '', '', '', '', ''],
        ['◉'.red, '', '', '', '', '', ''],
        ['◉'.red, '', '', '', '', '', ''],
        ['◉'.red, '', '', '', '', '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to be_check_for_all_wins
      end
    end

    context "when there's a win in the left diagonal of the board" do
      it 'returns true' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '◉'.red, '', '', ''],
        ['', '', '◉'.red, '', '', '', ''],
        ['', '◉'.red, '', '', '', '', ''],
        ['◉'.red, '', '', '', '', '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to be_check_for_all_wins
      end
    end

    context "when there's a when there's a win in the right diagonal of the board" do
      it 'returns true' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['◉'.blue, '', '', '', '', '', ''],
        ['', '◉'.blue, '', '', '', '', ''],
        ['', '', '◉'.blue, '', '', '', ''],
        ['', '', '', '◉'.blue, '', '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to be_check_for_all_wins
      end
    end

    context 'when there are no wins at all' do
      it 'returns false' do
        board_array = [
        ['◉'.blue, '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '◉'.blue, '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to_not be_check_for_all_wins
      end
    end
  end

  describe '#check_for_full_board?' do
    context "when the board's full" do
      it 'returns true' do
        board_array = [
        ['◉'.blue, '◉'.red, '◉'.blue, '◉'.red, '◉'.red, '◉'.blue, '◉'.blue],
        ['◉'.blue, '◉'.red, '◉'.red, '◉'.blue, '◉'.blue, '◉'.blue, '◉'.blue],
        ['◉'.blue, '◉'.red, '◉'.blue, '◉'.red, '◉'.red, '◉'.red, '◉'.red],
        ['◉'.blue, '◉'.red, '◉'.red, '◉'.red, '◉'.blue, '◉'.red, '◉'.blue],
        ['◉'.red, '◉'.blue, '◉'.blue, '◉'.red, '◉'.blue, '◉'.blue, '◉'.red],
        ['◉'.red, '◉'.red, '◉'.blue, '◉'.blue, '◉'.blue, '◉'.red, '◉'.red]
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to be_check_for_full_board
      end
    end

    context 'when board is not full' do
      it 'returns false' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['◉'.red, '◉'.blue, '', '', '', '', ''],
        ['◉'.red, '', '◉'.red, '', '', '', ''],
        ['', '◉'.blue, '', '◉'.red, '', '', '◉'.blue]
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to_not be_check_for_full_board
      end
    end

    context 'when board is empty' do
      it 'returns false' do
        board_array = [
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', ''],
        ['', '', '', '', '', '', '']
        ]
        Board.class_variable_set(:@@board_array, board_array)
        expect(board).to_not be_check_for_full_board
      end
    end
  end
end